class WorkAcceptanceNoteItemsController < ApplicationController
  before_action :set_work_acceptance_note_item, only: %i[ show edit update destroy ]

  # GET /work_acceptance_note_items or /work_acceptance_note_items.json
  def index
    @work_acceptance_note_items = WorkAcceptanceNoteItem.all
  end

  # GET /work_acceptance_note_items/1 or /work_acceptance_note_items/1.json
  def show
  end

  # GET /work_acceptance_note_items/new
  def new
    @work_acceptance_note_item = WorkAcceptanceNoteItem.new
  end

  # GET /work_acceptance_note_items/1/edit
  def edit
  end

  # POST /work_acceptance_note_items or /work_acceptance_note_items.json
  def create
    @work_acceptance_note_item = WorkAcceptanceNoteItem.new(work_acceptance_note_item_params)

    respond_to do |format|
      if @work_acceptance_note_item.save
        format.html { redirect_to work_acceptance_note_item_url(@work_acceptance_note_item), notice: "Work acceptance note item was successfully created." }
        format.json { render :show, status: :created, location: @work_acceptance_note_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @work_acceptance_note_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_acceptance_note_items/1 or /work_acceptance_note_items/1.json
  def update
    respond_to do |format|
      if @work_acceptance_note_item.update(work_acceptance_note_item_params)
        format.html { redirect_to work_acceptance_note_item_url(@work_acceptance_note_item), notice: "Work acceptance note item was successfully updated." }
        format.json { render :show, status: :ok, location: @work_acceptance_note_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @work_acceptance_note_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_acceptance_note_items/1 or /work_acceptance_note_items/1.json
  def destroy
    @work_acceptance_note_item.destroy!

    respond_to do |format|
      format.html { redirect_to work_acceptance_note_items_url, notice: "Work acceptance note item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_acceptance_note_item
      @work_acceptance_note_item = WorkAcceptanceNoteItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_acceptance_note_item_params
      params.require(:work_acceptance_note_item).permit(:number, :work_acceptance_note_id, :parent_id, :purch_order_item_id, :commodity_list_id, :product_group_id, :product_id, :qty, :measurement_unit_id, :unit_price, :price_unit, :subtotal, :sales_taxable, :amount_type, :wbsproject_id, :cost_center_id, :from_currency_id, :from_amount, :to_currency_id, :to_amount, :delivery_date, :desc, :specification, :note, :data, :deleted_at, :process_qty, :process_unit_price)
    end
end
