class PrcmtItemsController < ApplicationController
  before_action :set_prcmt_item, only: %i[ show edit update destroy ]

  # GET /prcmt_items or /prcmt_items.json
  def index
    @prcmt_items = PrcmtItem.all
  end

  # GET /prcmt_items/1 or /prcmt_items/1.json
  def show
  end

  # GET /prcmt_items/new
  def new
    @prcmt_item = PrcmtItem.new
  end

  # GET /prcmt_items/1/edit
  def edit
  end

  # POST /prcmt_items or /prcmt_items.json
  def create
    @prcmt_item = PrcmtItem.new(prcmt_item_params)

    respond_to do |format|
      if @prcmt_item.save
        format.html { redirect_to prcmt_item_url(@prcmt_item), notice: "Prcmt item was successfully created." }
        format.json { render :show, status: :created, location: @prcmt_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prcmt_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prcmt_items/1 or /prcmt_items/1.json
  def update
    respond_to do |format|
      if @prcmt_item.update(prcmt_item_params)
        format.html { redirect_to prcmt_item_url(@prcmt_item), notice: "Prcmt item was successfully updated." }
        format.json { render :show, status: :ok, location: @prcmt_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prcmt_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prcmt_items/1 or /prcmt_items/1.json
  def destroy
    @prcmt_item.destroy!

    respond_to do |format|
      format.html { redirect_to prcmt_items_url, notice: "Prcmt item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prcmt_item
      @prcmt_item = PrcmtItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prcmt_item_params
      params.require(:prcmt_item).permit(:prcmt_id, :number, :purch_reqn_item_id, :product_group_id, :product_id, :desired_vendor, :fixed_vendor, :qty, :measurement_unit_id, :est_unit_price, :price_unit, :est_subtotal, :currency_id, :purch_group_id, :requisitioner, :expected_delivery_date, :desc, :data, :specification, :note, :prcmt_award_item_id, :state, :awarded_at, :po_processed)
    end
end
