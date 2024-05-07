class VendorsController < ApplicationController
  before_action :set_vendor, only: %i[ show edit update destroy ]
  include Filterable
  include UserTrackable
  # GET /vendors or /vendors.json
  def index
    @vendors = selectable(Vendor.joins(:party, :vendor_type), :code, 'parties.full_name')
    @vendors = filter(@vendors, { vendor_name: 'parties.full_name', vendor_type: 'vendor_types.name' }, 'vendors.created_at', 'DESC')
    json = paginate_json(@vendors.select(:id, :code, 'parties.full_name as name'))

    @vendors = paginate(@vendors).decorate

    respond_to do |format|
      format.html do
        authorize @vendors.object
      end
      format.json { render json: }
    end
  end

  def company_types
    @company_types = selectable(LegalOrgType, :id, :name)
    json = paginate_json(@company_types, :id, :name)

    respond_to do |format|
      format.json { render json: }
    end
  end

  # GET /vendors/1 or /vendors/1.json
  def show
    respond_to do |format|
      format.turbo_stream do
        partial = params[:option]

        vendor = case partial
                 when 'general'
                   @vendor.vendor_facility
                 when 'deed'
                   @vendor.vendor_deed
                 when 'shareholder'
                   @vendor.vendor_shareholder
                 when 'boards'
                   @vendor.vendor_boards
                 when 'affiliates'
                   @vendor.vendor_affiliates
                 when 'permits'
                   @vendor.vendor_permits
                 when 'pic'
                   @vendor.vendor_pic
                 when 'classification'
                   @vendor.vendor_classification
                 when 'experience'
                   @vendor.vendor_experience
                 when 'bank'
                   @vendor.vendor_bank
                 when 'taxes'
                   @vendor.vendor_taxes
                 when 'psc'
                   @vendor.vendor_psc
                 else
                   @vendor
                 end

        stream = partial && vendor ? [
          turbo_stream.update(@vendor, partial:, locals: { vendor: }),
          turbo_stream.update('vendor_links', partial: 'vendor_links')
        ] : []

        render turbo_stream: stream
      end

      format.html
    end
  end

  # GET /vendors/new
  def new
    @vendor = Vendor.new

    respond_to do |format|
      format.html
      format.turbo_stream do
        country_id = Region.find(params[:country_id]).code === 'ID'
        render turbo_stream: [
          turbo_stream.update('country', partial: 'country', locals: { country_id: })
        ]
      end
    end
  end

  # GET /vendors/1/edit
  def edit; end

  # POST /vendors or /vendors.json
  def create
    @validation_errors = []

    ###########
    # PIC
    # ########
    user = current_user.decorate
    pic_id = user.id
    username = user.username
    mobile_number = pic_params[:phone_number]
    president_director = params[:president_director]

    @validation_errors << 'PIC Phone Number' if mobile_number.empty?
    @validation_errors << 'Vendor Name' if params[:vendor_name].empty?
    @validation_errors << 'President Director' if president_director.empty?
    @validation_errors << 'Phone Number' if params[:phone_number].empty?
    @validation_errors << 'Country' if params[:country_id].empty?
    @validation_errors << 'Address' if params[:address].nil? && params[:address].empty?
    @validation_errors << 'Province' if params[:province_id].nil? && params[:province_id].empty?
    @validation_errors << 'City' if params[:city_id].nil? && params[:city_id].empty?
    @validation_errors << 'Sub-District' if params[:sub_district_id].nil? && params[:sub_district_id].empty?
    @validation_errors << 'Postal Code' if params[:postal_code].nil? && params[:postal_code].empty?
    @validation_errors << 'Bank' if bank_params[:bank_id].empty?
    @validation_errors << 'Account Number' if bank_params[:account_number].empty?
    @validation_errors << 'Account Holder Name' if bank_params[:account_holder_name].empty?
    @validation_errors << 'Bank Address' if bank_params[:address].empty?
    @validation_errors << 'Branch Office' if bank_params[:branch_office].empty?
    @validation_errors << 'Currency' if bank_params[:currency_id].empty?
    @validation_errors << 'Bank Statement Attachment' unless bank_params.include?(:bank_statement_attachment)
    @validation_errors << 'Justification' if justification_params[:justification].empty?
    @validation_errors << 'Justification Attachment' unless justification_params.include?(:justification_attachment)

    # binding.pry
    return render :new, status: :unprocessable_entity if @validation_errors.any?

    ###########
    # CURRENCY
    # #######
    currency = Currency.select('id', 'code', 'name').find(bank_params[:currency_id])
    currency_id = currency.id
    currency = currency.attributes

    ##########
    # VENDOR
    # ########
    full_name = params[:vendor_name]
    email = { electronic_address: params[:email] }
    website = params[:website]
    country = get_region_attr(params[:country_id])
    district = country['code'] === 'ID' ? get_region_attr(params[:city_id]) : params[:city_id]
    province = country['code'] === 'ID' ? get_region_attr(params[:province_id]) : params[:province_id]
    sub_district = country['code'] === 'ID' ? get_region_attr(params[:sub_district_id]) : params[:sub_district_id]
    postal_code = country['code'] === 'ID' ? params[:postal_code][0] : params[:postal_code]
    postal_address = country['code'] === 'ID' ? params[:address][0] : params[:address]
    address = { country:, province:, district:, sub_district:, postal_code:, postal_address: }

    #######
    # BANK
    # #####
    bank = Bank.joins(:party).select(:id, :code, 'parties.full_name').find(bank_params[:bank_id])
    bank_id = bank.id
    bank = bank.attributes
    branch_name = bank_params[:branch_name]
    bank_address = { postal_address: bank_params[:address] }

    #########
    # PARTY
    # ######
    party_type = 'ORGANIZATION'
    party_id = Party.create!({ full_name:, party_type:, **tracker }).id

    #################
    # LEGAL ORG TYPE
    # ##############
    legal_org_type = LegalOrgType.select('id', 'name', 'ident_name').find(params[:company_type_id])
    legal_org_type_id = legal_org_type.id

    #################
    # LEGAL ORG
    # ##############
    legal_org = LegalOrg.create!({ party_id:, legal_org_type_id:, **tracker })
    legal_org_id = legal_org.id
    legal_org_type = legal_org_type.attributes

    #################
    # LEGAL ORG CRED
    # ##############
    legal_org_cred_type_id = LegalOrgCredType.find_by(ident_name: 'NPWP').id
    legal_org_cred = LegalOrgCred.create!({ legal_org_id:, legal_org_cred_type_id:, number: tax_params[:tax_identification_number] })
    legal_org_cred.doc.attach(tax_params[:tax_identification_attachment])
    npwp_file = legal_org_cred.doc
    npwp_file = { id: npwp_file.id, url: url_for(npwp_file), file_name: npwp_file.filename.to_s }
    npwp_number = tax_params[:tax_identification_number]

    #################
    # JUSTIFICATION
    # ##############
    justification = justification_params[:justification]
    legal_org.justification_file.attach(justification_params[:justification_attachment])
    justification_file = legal_org.justification_file
    justification_file = {
      id: justification_file.id,
      url: url_for(justification_file),
      file_name: justification_file.filename.to_s
    }

    legal_org.bank_statement_file.attach(bank_params[:bank_statement_attachment])
    bank_statement_file = legal_org.bank_statement_file
    bank_statement_file = {
      id: bank_statement_file.id,
      url: url_for(bank_statement_file),
      file_name: bank_statement_file.filename.to_s
    }

    #################
    # VENDOR
    # ##############
    vendor_type = VendorType.select('id', 'name', 'ident_name').find(params[:vendor_type_id]).attributes
    vendor_type_id = vendor_type['id']
    vendor = Vendor.create!({ party_id:, vendor_type_id:, state: 'ACTIVE', **tracker })
    vendor_registration_id = VendorRegistration.create!({ vendor_id: vendor.id, number: vendor.code, vendor_type_id:, state: 'VENDOR', **tracker }).id

    account_number = bank_params[:account_number]
    account_holder_name = bank_params[:account_holder_name]
    fax_number = { number: params[:fax_number] }
    phone_number = { number: params[:phone_number] }
    is_primary = true

    entry_common = {
      entry_type: 'CREATE',
      plurality: 'PLURAL',
      vendor_registration_id:,
      **tracker
    }
    vendor_entry_type_id = VendorRegistrationEntryGroup.find_by(ident_name: 'GENERAL').id
    vendor.vendor_registration_entries.create!({ **entry_common, plurality: 'SINGULAR', vendor_registration_entry_group_id: vendor_entry_type_id, data: {
      spda: nil,
      k3s_name: nil,
      civd_registration_id: nil,
      full_name:,
      vendor_type:,
      legal_org_type:
    } })

    #################
    # LEGAL ORG CRED **
    # ##############
    legal_cred_common = { tax_year: nil, issued_date: nil, expired_date: nil }
    cred_entry_type_id = VendorRegistrationEntryGroup.find_by(ident_name: 'TAX_DOC').id
    legal_org_cred.vendor_registration_entries.create!({ **entry_common, vendor_registration_entry_group_id: cred_entry_type_id, data: {
      **legal_cred_common, number: npwp_number, doc_file: npwp_file, tax_doc_type: legal_org_type, legal_org:
    } })

    #################
    # Party Facility **
    # ##############
    facility = Facility.create!({ name: full_name, facility_type: 'FACILITY', **tracker })
    party_facility_type = PartyFacilityRole.find_by(ident_name: 'USE_AS_BRANCH_OFFICE')
    party_facility_role_id = party_facility_type.id

    office_type = {
      id: party_facility_type.id,
      name: party_facility_type.name,
      ident_name: party_facility_type.ident_name
    }

    facility_entry_type_id = VendorRegistrationEntryGroup.find_by(ident_name: 'OFFICE').id
    party_facility = PartyFacility.create!({ facility_id: facility.id, party_facility_role_id:, party_id:, **tracker })
    party_facility.vendor_registration_entries.create!({ **entry_common, vendor_registration_entry_group_id: facility_entry_type_id, data: { email:, address:, website:, full_name:, phone_number:, fax_number:, is_primary:, office_type: } })

    #################
    # LEGAL ORG BOARD **
    # ##############
    legal_org_board_type = LegalOrgBoardType.select('id', 'name', 'ident_name').find_by(ident_name: 'BOD')
    legal_org_board_type_id = legal_org_board_type.id
    board_membership_type = legal_org_board_type.attributes
    board_common = {
      ktp: nil,
      npwp: nil,
      email: nil,
      kitas: nil,
      ktp_file: nil,
      full_name: president_director,
      npwp_file: nil,
      kitas_file: nil,
      nationality: nil,
      phone_number: nil,
      is_shareholder: nil,
      position_title: nil,
      is_company_head: true,
      board_membership_type:,
      signature_sample_file: nil
    }

    board_entry_type_id = VendorRegistrationEntryGroup.find_by(ident_name: 'BOD_BOC').id
    legal_org_board = LegalOrgBoard.create!({ legal_org_id:, legal_org_board_type_id:, party_id:, **tracker })
    legal_org_board.vendor_registration_entries.create!({ **entry_common, vendor_registration_entry_group_id: board_entry_type_id, data: board_common })

    #################
    # BANK ACCT **
    # ##############
    bank_entry_type_id = VendorRegistrationEntryGroup.find_by(ident_name: 'BANK_ACCOUNT').id
    party_bank_acct = PartyBankAcct.create!({ party_id:, bank_id:, branch_name:, currency_id:, acct_name: account_holder_name, acct_number: account_number, **tracker })
    party_bank_acct.vendor_registration_entries.create!({ **entry_common, vendor_registration_entry_group_id: bank_entry_type_id, data: {
      bank:, address: bank_address, currency:, branch_name:, account_number:, account_holder_name:, bank_statement_file:
    } })

    #################
    # PARTY PIC **
    # ##############
    pic_entry_type_id = VendorRegistrationEntryGroup.find_by(ident_name: 'PIC').id
    party_pic = PartyPic.create!({ party_id:, pic_id:, **tracker })
    party_pic.vendor_registration_entries.create!({ **entry_common, vendor_registration_entry_group_id: pic_entry_type_id,
                                                    data: { email: user.email, username:, full_name: user.full_name, is_primary:, mobile_number:, alternate_email: nil } })

    #################
    # MISC **
    # ##############
    json = { vendor_type:, email:, address:, website:, currency:,
             npwp_file:, npwp_number:, pic_full_name: '',
             pic_email: { electronic_address: '' },
             pic_mobile_phone_number: { number: '' },
             fax_number:, bank:, bank_address:, bank_statement_file:,
             branch_name:, account_number:, account_holder_name:,
             legal_org_type:, justification:, justification_file: }

    VendorRegistrationEntry.create!({ **entry_common, plurality: 'SINGULAR', data: json })

    @vendor = vendor
    respond_to do |format|
      if @vendor
        format.html { redirect_to vendor_url(@vendor), notice: "Vendor was successfully created." }
        format.json { render :show, status: :created, location: @vendor }
        #   else
        #     format.html { render :new, status: :unprocessable_entity }
        #     format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendors/1 or /vendors/1.json
  def update
    respond_to do |format|
      if @vendor.update(params)
        format.html { redirect_to vendor_url(@vendor), notice: "Vendor was successfully updated." }
        format.json { render :show, status: :ok, location: @vendor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors/1 or /vendors/1.json
  def destroy
    @vendor.destroy!

    respond_to do |format|
      format.html { redirect_to vendors_url, notice: "Vendor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vendor
    @vendor = Vendor.find(params[:id])
    authorize @vendor
    @vendor = VendorDecorator.new(@vendor)
  end

  # Only allow a list of trusted parameters through.
  # def params
  #   params.require(:vendor)
  #         .permit(:code, :from_date, :thru_date, :created_at,
  #                 :updated_at, :created_by_id, :updated_by_id,
  #                 :active_vendor_status_id, :data, :vendor_type_id, :state,
  #                 :vendor_name, :company_type_id, :president_director, :phone_number,
  #                 :fax_number, :email, :website, :country_id, :province_id, :city_id,
  #                 :sub_district_id, :postal_code, :address)
  # end

  def bank_params
    params.require(:bank)
          .permit(:bank_id, :account_number, :account_holder_name, :address,
                  :branch_office, :currency_id, :bank_statement_attachment)
  end

  def tax_params
    params.require(:tax)
          .permit(:tax_identification_number, :tax_identification_attachment)
  end

  def pkp_params
    params.require(:pkp)
          .permit(:pkp_number, :pkp_attachment)
  end

  def justification_params
    params.require(:justification)
          .permit(:justification, :justification_attachment)
  end

  def pic_params
    params.require(:pic)
          .permit(:full_name, :phone_number, :email, :position, :department)
  end

  private

  def get_region_attr(id)
    Region.select('id', 'code', 'name').find(id).attributes
  end
end
