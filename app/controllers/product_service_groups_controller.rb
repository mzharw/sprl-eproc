class ProductServiceGroupsController < ApplicationController
  before_action :set_service_group, only: %i[ show edit update destroy ]
  include UserTrackable
  include Filterable

  # GET /service_groups or /service_groups.json
  def index
    @service_groups = selectable(ProductGroup.service, :code, :name)
    json = paginate_json(@service_groups.all)
    @service_groups = filter(@service_groups)

    @service_groups = paginate(@service_groups).decorate

    respond_to do |format|
      format.html do
        authorize @service_groups.object
      end
      format.json { render json: }
    end
  end

  # GET /service_groups/1 or /service_groups/1.json
  def show
  end

  # GET /service_groups/new
  def new
    @product_group = ProductGroup.new
  end

  # GET /service_groups/1/edit
  def edit
  end

  # POST /service_groups or /service_groups.json
  def create
    @product_group = ProductGroup.new({ **service_group_params, **tracker, is_service: true })

    respond_to do |format|
      if @product_group.save
        format.html { redirect_to product_service_group_url(@product_group), notice: "Service group was successfully created." }
        format.json { render :show, status: :created, location: @product_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_groups/1 or /service_groups/1.json
  def update
    respond_to do |format|
      if @product_group.update({ **service_group_params, **tracker(:update) })
        format.html { redirect_to product_service_group_url(@product_group), notice: "Service group was successfully updated." }
        format.json { render :show, status: :ok, location: @product_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_groups/1 or /service_groups/1.json
  def destroy
    @product_group.destroy!

    respond_to do |format|
      format.html { redirect_to product_service_groups_url, notice: "Service group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_service_group
    @product_group = ProductGroup.find(params[:id])
    authorize @product_group
  end

  # Only allow a list of trusted parameters through.
  def service_group_params
    params.require(:product_group).permit(:code, :name, :desc, :created_by_id, :updated_by_id)
  end
end
