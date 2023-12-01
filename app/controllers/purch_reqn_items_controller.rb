class PurchReqnItemsController < ApplicationController
  before_action :set_purch_reqn_item, only: %i[ show edit update destroy ]

  # GET /purch_reqn_items or /purch_reqn_items.json
  def index
    @purch_reqn_items = PurchReqnItem.all
  end

  # GET /purch_reqn_items/1 or /purch_reqn_items/1.json
  def show
  end

  # GET /purch_reqn_items/new
  def new
    @purch_reqn_item = PurchReqnItem.new
  end

  # GET /purch_reqn_items/1/edit
  def edit
  end

  # POST /purch_reqn_items or /purch_reqn_items.json
  def create
    @purch_reqn_item = PurchReqnItem.new(purch_reqn_item_params)

    respond_to do |format|
      if @purch_reqn_item.save
        format.html { redirect_to purch_reqn_item_url(@purch_reqn_item), notice: "Purch reqn item was successfully created." }
        format.json { render :show, status: :created, location: @purch_reqn_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purch_reqn_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purch_reqn_items/1 or /purch_reqn_items/1.json
  def update
    respond_to do |format|
      if @purch_reqn_item.update(purch_reqn_item_params)
        format.html { redirect_to purch_reqn_item_url(@purch_reqn_item), notice: "Purch reqn item was successfully updated." }
        format.json { render :show, status: :ok, location: @purch_reqn_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purch_reqn_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purch_reqn_items/1 or /purch_reqn_items/1.json
  def destroy
    @purch_reqn_item.destroy!

    respond_to do |format|
      format.html { redirect_to purch_reqn_items_url, notice: "Purch reqn item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purch_reqn_item
      @purch_reqn_item = PurchReqnItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purch_reqn_item_params
      params.require(:purch_reqn_item).permit(:app_id, :purch_reqn_id, :number, :product_group_id, :product_id, :desired_vendor, :fixed_vendor, :qty, :measurement_unit_id, :est_unit_price, :price_unit, :est_subtotal, :currency_id, :requisitioner, :expected_delivery_date, :desc, :data, :created_by_id, :updated_by_id, :processed_qty, :specification, :note, :deleted_at, :deleted_by_id, :item_type, :wbsproject_id, :parent_id, :contract_item_reference_id, :contract_flag, :purch_reqn_item_noncontract_id, :commodity_list, :adjustment_qty)
    end
end
