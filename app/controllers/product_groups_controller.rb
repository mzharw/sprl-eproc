class ProductGroupsController < ApplicationController
  include Filterable
  include UserTrackable
  before_action :set_product_group, only: %i[show edit update destroy]

  # GET /product_groups or /product_groups.json
  def index
    @product_groups = selectable(ProductGroup, :code, :name)
    json = paginate_json(@product_groups.all)
    @product_groups = filter(@product_groups)

    @product_groups = paginate(@product_groups).decorate

    respond_to do |format|
      format.html do
        authorize @product_groups.object
      end
      format.json { render json: }
    end
  end

  # GET /product_groups/1 or /product_groups/1.json
  def show; end

  # GET /product_groups/new
  def new
    @product_group = ProductGroup.new
  end

  # GET /product_groups/1/edit
  def edit; end

  # POST /product_groups or /product_groups.json
  def create
    @product_group = ProductGroup.new({ **product_group_params, **tracker })

    respond_to do |format|
      if @product_group.save
        format.html do
          redirect_to product_group_url(@product_group), notice: 'Product group was successfully created.'
        end
        format.json { render :show, status: :created, location: @product_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_groups/1 or /product_groups/1.json
  def update
    respond_to do |format|
      if @product_group.update({ **product_group_params, **tracker(:update) })
        format.html do
          redirect_to product_group_url(@product_group), notice: 'Product group was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @product_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_groups/1 or /product_groups/1.json
  def destroy
    @product_group.destroy!

    respond_to do |format|
      format.html { redirect_to product_groups_url, notice: 'Product group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product_group
    @product_group = ProductGroup.find(params[:id])
    authorize @product_group
  end

  # Only allow a list of trusted parameters through.
  def product_group_params
    params.require(:product_group).permit(:code, :name, :desc, :created_by_id, :updated_by_id)
  end
end
