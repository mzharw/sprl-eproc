class ProductServicesController < ApplicationController
  before_action :set_service, only: %i[ show edit update destroy new_item create_item update_item edit_item delete_item ]
  include UserTrackable
  include Filterable

  # GET /services or /services.json
  def index
    @services = selectable(Product.service, :code, :name, filter: 'product_group_id')
    json = paginate_json(@services)
    @services = filter(@services)
    @services = paginate(@services)

    respond_to do |format|
      format.html do
        authorize @services
      end
      format.json { render json: }
    end
  end

  # GET /services/1 or /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Product.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services or /services.json
  def create
    @service = Product.new({ **service_params, **tracker, is_service: true })

    respond_to do |format|
      if @service.save
        format.html { redirect_to product_service_url(@service), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1 or /services/1.json
  def update
    respond_to do |format|
      if @service.update({ **service_params, **tracker(:update) })
        format.html { redirect_to product_service_url(@service), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1 or /services/1.json
  def destroy
    @service.destroy!

    respond_to do |format|
      format.html { redirect_to product_service_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def items

  end

  def new_item
    @product_item = @service.product_items.new
  end

  def create_item
    @product_item = @service.product_items.new({ **service_item_params, **tracker })

    respond_to do |format|
      if @product_item.save
        format.html { redirect_to product_service_url(@service), notice: "Product item was successfully created." }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new_item, status: :unprocessable_entity }
        format.json { render json: @product_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_item
    @product_item = ProductItem.find(params[:item_id])
  end

  def update_item
    @product_item = ProductItem.find(params[:item_id])

    respond_to do |format|
      if @product_item.update({ **service_item_params, **tracker(:update) })
        format.html { redirect_to product_service_url(@service), notice: "Product item was successfully updated." }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new_item, status: :unprocessable_entity }
        format.json { render json: @product_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_item
    @product_item = ProductItem.find(params[:item_id])
    respond_to do |format|
      if @product_item.destroy
        format.html { redirect_to product_service_url(@service), notice: "Product item was successfully destroyed." }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new_item, status: :unprocessable_entity }
        format.json { render json: @product_item.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_service
    @service = Product.find(params[:id])
    authorize @service
  end

  # Only allow a list of trusted parameters through.
  def service_params
    params.require(:product).permit(:product_type, :product_group_id, :code, :name, :measurement_unit_id, :desc, :created_by_id, :updated_by_id)
  end

  def service_item_params
    params.require(:product_item).permit(:measurement_unit_id, :description, :unit_price, :number)
  end
end
