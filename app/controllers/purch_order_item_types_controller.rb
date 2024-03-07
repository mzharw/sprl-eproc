class PurchOrderItemTypesController < ApplicationController
  before_action :set_purch_order_item_type, only: %i[ show edit update destroy ]

  # GET /purch_order_item_types or /purch_order_item_types.json
  def index
    @purch_order_item_types = PurchOrderItemType.all
  end

  # GET /purch_order_item_types/1 or /purch_order_item_types/1.json
  def show
  end

  # GET /purch_order_item_types/new
  def new
    @purch_order_item_type = PurchOrderItemType.new
  end

  # GET /purch_order_item_types/1/edit
  def edit
  end

  # POST /purch_order_item_types or /purch_order_item_types.json
  def create
    @purch_order_item_type = PurchOrderItemType.new(purch_order_item_type_params)

    respond_to do |format|
      if @purch_order_item_type.save
        format.html { redirect_to purch_order_item_type_url(@purch_order_item_type), notice: "Purch order item type was successfully created." }
        format.json { render :show, status: :created, location: @purch_order_item_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purch_order_item_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purch_order_item_types/1 or /purch_order_item_types/1.json
  def update
    respond_to do |format|
      if @purch_order_item_type.update(purch_order_item_type_params)
        format.html { redirect_to purch_order_item_type_url(@purch_order_item_type), notice: "Purch order item type was successfully updated." }
        format.json { render :show, status: :ok, location: @purch_order_item_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purch_order_item_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purch_order_item_types/1 or /purch_order_item_types/1.json
  def destroy
    @purch_order_item_type.destroy!

    respond_to do |format|
      format.html { redirect_to purch_order_item_types_url, notice: "Purch order item type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purch_order_item_type
      @purch_order_item_type = PurchOrderItemType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purch_order_item_type_params
      params.require(:purch_order_item_type).permit(:parent_id, :ident_name, :name, :desc, :sign, :seq, :children_allowed, :sales_taxable, :system)
    end
end
