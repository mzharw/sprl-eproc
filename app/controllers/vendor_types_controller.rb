class VendorTypesController < ApplicationController
  before_action :set_vendor_type, only: %i[ show edit update destroy ]

  # GET /vendor_types or /vendor_types.json
  def index
    @vendor_types = VendorType.all
  end

  # GET /vendor_types/1 or /vendor_types/1.json
  def show
  end

  # GET /vendor_types/new
  def new
    @vendor_type = VendorType.new
  end

  # GET /vendor_types/1/edit
  def edit
  end

  # POST /vendor_types or /vendor_types.json
  def create
    @vendor_type = VendorType.new(vendor_type_params)

    respond_to do |format|
      if @vendor_type.save
        format.html { redirect_to vendor_type_url(@vendor_type), notice: "Vendor type was successfully created." }
        format.json { render :show, status: :created, location: @vendor_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vendor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendor_types/1 or /vendor_types/1.json
  def update
    respond_to do |format|
      if @vendor_type.update(vendor_type_params)
        format.html { redirect_to vendor_type_url(@vendor_type), notice: "Vendor type was successfully updated." }
        format.json { render :show, status: :ok, location: @vendor_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vendor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendor_types/1 or /vendor_types/1.json
  def destroy
    @vendor_type.destroy!

    respond_to do |format|
      format.html { redirect_to vendor_types_url, notice: "Vendor type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor_type
      @vendor_type = VendorType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vendor_type_params
      params.require(:vendor_type).permit(:ident_name, :name, :desc, :system, :created_at, :updated_at, :created_by_id, :updated_by_id)
    end
end
