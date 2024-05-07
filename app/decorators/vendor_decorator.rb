class VendorDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def vendor_name
    party&.full_name
  end

  def json_data(**_options)
    data = vendor_registration&.vendor_registration_entries
    # distinct_on = 'entryable_id'
    #
    # opt_distinct_on = options[:distinct_on]
    # distinct_on = opt_distinct_on || distinct_on
    #
    # data = data&.select("DISTINCT ON (#{Arel.sql(distinct_on)}) *")&.order(Arel.sql(distinct_on), updated_at: :desc) unless opt_distinct_on == false
    data&.select("DISTINCT ON (ident_uuid) *")&.order(:ident_uuid, updated_at: :desc)

    # data
  end

  def vendor
    json_data.where(entryable_id: id).first
  end

  def vendor_data
    vendor&.data
  end

  def vendor_k3s
    vendor_data['k3s_name'] if vendor_data
  end

  def vendor_legal_org_type
    object&.legal_org&.legal_org_type || vendor_data['legal_org_type']
  end

  def vendor_company_type
    vendor_legal_org_type['name'] if vendor_legal_org_type
  end

  def vendor_civd_reg_id
    vendor_data['civd_registration_id'] if vendor_data
  end

  def vendor_facility
    vendor_registration_entry_group_id = VendorRegistrationEntryGroup.find_by(ident_name: 'OFFICE').id
    json_data.where(vendor_registration_entry_group_id:)
  end

  def vendor_deed
    vendor_registration_entry_group_id = VendorRegistrationEntryGroup.find_by(ident_name: 'DEED').id
    json_data.where(vendor_registration_entry_group_id:)
  end

  def vendor_shareholder
    vendor_registration_entry_group_id = VendorRegistrationEntryGroup.find_by(ident_name: 'SHAREHOLDER').id
    json_data.where(vendor_registration_entry_group_id:)
  end

  def vendor_boards
    vendor_registration_entry_group_id = VendorRegistrationEntryGroup.find_by(ident_name: 'BOD_BOC').id
    json_data.where(vendor_registration_entry_group_id:)
  end

  def vendor_affiliates
    vendor_registration_entry_group_id = VendorRegistrationEntryGroup.find_by(ident_name: 'AFFILIATE_ALLIANCE').id
    json_data.where(vendor_registration_entry_group_id:)
  end

  def vendor_permits
    vendor_registration_entry_group_id = VendorRegistrationEntryGroup.find_by(ident_name: 'BUSINESS_PERMIT').id
    json_data.where(vendor_registration_entry_group_id:)
  end

  def vendor_pic
    vendor_registration_entry_group_id = VendorRegistrationEntryGroup.find_by(ident_name: 'PIC').id
    json_data.where(vendor_registration_entry_group_id:)
  end

  def vendor_letters
    vendor_registration_entry_group_id = VendorRegistrationEntryGroup.find_by(ident_name: 'PIC').id
    json_data.where(vendor_registration_entry_group_id:)
  end

  def vendor_classification
    vendor_registration_entry_group_id = VendorRegistrationEntryGroup.find_by(ident_name: 'COMPETENCY').id
    json_data.where(vendor_registration_entry_group_id:)
  end

  def vendor_experience
    vendor_registration_entry_group_id = VendorRegistrationEntryGroup.find_by(ident_name: 'PORTFOLIO').id
    json_data.where(vendor_registration_entry_group_id:)
  end

  def vendor_bank
    vendor_registration_entry_group_id = VendorRegistrationEntryGroup.find_by(ident_name: 'BANK_ACCOUNT').id
    json_data.where(vendor_registration_entry_group_id:)
  end

  def vendor_taxes
    vendor_registration_entry_group_id = VendorRegistrationEntryGroup.find_by(ident_name: 'TAX_DOC').id
    json_data.where(vendor_registration_entry_group_id:)
  end

  def vendor_psc
    vendor_registration_entry_group_id = VendorRegistrationEntryGroup.find_by(ident_name: 'KKKS_PARTNERSHIP').id
    json_data.where(vendor_registration_entry_group_id:)
  end

end
