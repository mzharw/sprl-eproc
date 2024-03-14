class ProductsController < ApplicationController
  include UserTrackable
  include Filterable
  before_action :set_product, only: %i[show edit update destroy]

  # GET /products or /products.json
  def index
    @products = selectable(Product, :code, :name, filter: 'product_group_id')
    json = paginate_json(@products.all)
    @products = filter(@products)
    @products = paginate(@products)

    respond_to do |format|
      format.html do
        authorize @products
      end
      format.json { render json: }
    end
  end

  # GET /products/1 or /products/1.json
  def show; end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products or /products.json
  def create
    @product = Product.new({ **product_params, **tracker })

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update({ **product_params, **tracker(:update) })
        format.html { redirect_to product_url(@product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
    authorize @product
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:product_type, :product_group_id, :code, :name, :measurement_unit_id,
                                    :created_at, :updated_at, :created_by_id, :updated_by_id, :desc)
  end
end
