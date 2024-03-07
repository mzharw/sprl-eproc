class PurchOrderTypesController < ApplicationController
  before_action :set_purch_order_type, only: %i[ show edit update destroy ]
  include Filterable
  # GET /purch_order_types or /purch_order_types.json
  def index
    @purch_order_types = selectable(PurchOrderType, :name)
    @purch_order_types = filter(@purch_order_types)
    json = paginate(@purch_order_types.select(:id, :name))

    respond_to do |format|
      format.html
      format.json { render json: }
    end
  end

  # GET /purch_order_types/1 or /purch_order_types/1.json
  def show
  end

  # GET /purch_order_types/new
  def new
    @purch_order_type = PurchOrderType.new
  end

  # GET /purch_order_types/1/edit
  def edit
  end

  # POST /purch_order_types or /purch_order_types.json
  def create
    @purch_order_type = PurchOrderType.new(purch_order_type_params)

    respond_to do |format|
      if @purch_order_type.save
        format.html { redirect_to purch_order_type_url(@purch_order_type), notice: "Purch order type was successfully created." }
        format.json { render :show, status: :created, location: @purch_order_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purch_order_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purch_order_types/1 or /purch_order_types/1.json
  def update
    respond_to do |format|
      if @purch_order_type.update(purch_order_type_params)
        format.html { redirect_to purch_order_type_url(@purch_order_type), notice: "Purch order type was successfully updated." }
        format.json { render :show, status: :ok, location: @purch_order_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purch_order_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purch_order_types/1 or /purch_order_types/1.json
  def destroy
    @purch_order_type.destroy!

    respond_to do |format|
      format.html { redirect_to purch_order_types_url, notice: "Purch order type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purch_order_type
    @purch_order_type = PurchOrderType.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def purch_order_type_params
    params.require(:purch_order_type).permit(:ident_name, :name, :desc, :system)
  end
end
