class VendorsController < ApplicationController
  before_action :set_vendor, only: %i[ show edit update destroy ]
  include Filterable
  # GET /vendors or /vendors.json
  def index
    @vendors = selectable(Vendor.joins(:party, :vendor_type), :code, 'parties.full_name')
    @vendors = filter(@vendors, { vendor_name: 'parties.full_name', vendor_type: 'vendor_type.name' })
    json = paginate_json(@vendors.select(:id, :code, 'parties.full_name as name'))

    @vendors = paginate(@vendors).decorate

    respond_to do |format|
      format.html do
        authorize @vendors.object
      end
      format.json { render json: }
    end
  end

  # GET /vendors/1 or /vendors/1.json
  def show
  end

  # GET /vendors/new
  def new
    @vendor = Vendor.new
  end

  # GET /vendors/1/edit
  def edit
  end

  # POST /vendors or /vendors.json
  def create
    @vendor = Vendor.new(vendor_params)

    respond_to do |format|
      if @vendor.save
        format.html { redirect_to vendor_url(@vendor), notice: "Vendor was successfully created." }
        format.json { render :show, status: :created, location: @vendor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendors/1 or /vendors/1.json
  def update
    respond_to do |format|
      if @vendor.update(vendor_params)
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
  end

  # Only allow a list of trusted parameters through.
  def vendor_params
    params.require(:vendor).permit(:code, :from_date, :thru_date, :created_at, :updated_at, :created_by_id, :updated_by_id, :active_vendor_status_id, :data, :vendor_type_id, :state)
  end
end
