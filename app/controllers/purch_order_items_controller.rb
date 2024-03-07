class PurchOrderItemsController < ApplicationController
  before_action :set_purch_order_item, only: %i[ show edit update destroy ]

  # GET /purch_order_items or /purch_order_items.json
  def index
    @purch_order_items = PurchOrderItem.all
  end

  # GET /purch_order_items/1 or /purch_order_items/1.json
  def show
  end

  # GET /purch_order_items/new
  def new
    @purch_order_item = PurchOrderItem.new
  end

  # GET /purch_order_items/1/edit
  def edit
  end

  # POST /purch_order_items or /purch_order_items.json
  def create
    @purch_order_item = PurchOrderItem.new(purch_order_item_params)

    respond_to do |format|
      if @purch_order_item.save
        format.html { redirect_to purch_order_item_url(@purch_order_item), notice: "Purch order item was successfully created." }
        format.json { render :show, status: :created, location: @purch_order_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purch_order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purch_order_items/1 or /purch_order_items/1.json
  def update
    respond_to do |format|
      if @purch_order_item.update(purch_order_item_params)
        format.html { redirect_to purch_order_item_url(@purch_order_item), notice: "Purch order item was successfully updated." }
        format.json { render :show, status: :ok, location: @purch_order_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purch_order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purch_order_items/1 or /purch_order_items/1.json
  def destroy
    @purch_order_item.destroy!

    respond_to do |format|
      format.html { redirect_to purch_order_items_url, notice: "Purch order item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purch_order_item
      @purch_order_item = PurchOrderItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purch_order_item_params
      params.require(:purch_order_item).permit(:purch_order, :number, :purch_reqn_item, :prcmt_item, :product_group, :product, :qty, :measurement_unit, :unit_price, :price_unit, :subtotal, :desc, :specification, :note, :data, :created_by, :updated_by, :delivery_date, :from_currency, :from_amount, :to_currency, :to_amount, :purch_order_item_type, :line_total, :sales_taxable, :ancestry, :ancestry_depth, :amount_type, :seq, :process_qty, :item_type, :parent, :wbsproject, :cost_center, :process_unit_price)
    end
end
