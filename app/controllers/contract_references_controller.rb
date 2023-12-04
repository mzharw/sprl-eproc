class ContractReferencesController < ApplicationController
  before_action :set_contract_reference, only: %i[ show edit update destroy ]

  # GET /contract_references or /contract_references.json
  def index
    @contract_references = ContractReference.all
  end

  # GET /contract_references/1 or /contract_references/1.json
  def show
  end

  # GET /contract_references/new
  def new
    @contract_reference = ContractReference.new
  end

  # GET /contract_references/1/edit
  def edit
  end

  # POST /contract_references or /contract_references.json
  def create
    @contract_reference = ContractReference.new(contract_reference_params)

    respond_to do |format|
      if @contract_reference.save
        format.html { redirect_to contract_reference_url(@contract_reference), notice: "Contract reference was successfully created." }
        format.json { render :show, status: :created, location: @contract_reference }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contract_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contract_references/1 or /contract_references/1.json
  def update
    respond_to do |format|
      if @contract_reference.update(contract_reference_params)
        format.html { redirect_to contract_reference_url(@contract_reference), notice: "Contract reference was successfully updated." }
        format.json { render :show, status: :ok, location: @contract_reference }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contract_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contract_references/1 or /contract_references/1.json
  def destroy
    @contract_reference.destroy!

    respond_to do |format|
      format.html { redirect_to contract_references_url, notice: "Contract reference was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract_reference
      @contract_reference = ContractReference.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contract_reference_params
      params.require(:contract_reference).permit(:app_id, :contact_type_id, :number, :country_id, :other_country, :province_id, :other_province, :district_id, :other_district, :sub_district_id, :other_sub_district, :village_id, :other_village, :postal_address, :electronic_address, :created_at, :updated_at, :created_by, :updated_by_id, :area_code, :ext, :postal_code)
    end
end
