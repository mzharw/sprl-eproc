class CostCentersController < ApplicationController
  include UserTrackable
  include Filterable
  before_action :set_cost_center, only: %i[show edit update destroy]

  # GET /cost_centers or /cost_centers.json
  def index
    @cost_centers = selectable(CostCenter, :cost_center_id, '"desc"')
    @cost_centers = filter(@cost_centers, { description: '"desc"' })
    @cost_centers = @cost_centers.page(params[:page])

    respond_to do |format|
      format.html do
        authorize @cost_centers
      end
      format.json { render json: @cost_centers }
    end
  end

  # GET /cost_centers/1 or /cost_centers/1.json
  def show; end

  # GET /cost_centers/new
  def new
    @cost_center = CostCenter.new
  end

  # GET /cost_centers/1/edit
  def edit; end

  # POST /cost_centers or /cost_centers.json
  def create
    @cost_center = CostCenter.new({ **cost_center_params, **tracker })

    respond_to do |format|
      if @cost_center.save
        format.html { redirect_to cost_center_url(@cost_center), notice: 'Cost center was successfully created.' }
        format.json { render :show, status: :created, location: @cost_center }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cost_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cost_centers/1 or /cost_centers/1.json
  def update
    respond_to do |format|
      if @cost_center.update(cost_center_params)
        format.html { redirect_to cost_center_url(@cost_center), notice: 'Cost center was successfully updated.' }
        format.json { render :show, status: :ok, location: @cost_center }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cost_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cost_centers/1 or /cost_centers/1.json
  def destroy
    @cost_center.destroy!

    respond_to do |format|
      format.html { redirect_to cost_centers_url, notice: 'Cost center was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cost_center
    @cost_center = CostCenter.find(params[:id])
    authorize @cost_center
  end

  # Only allow a list of trusted parameters through.
  def cost_center_params
    params.require(:cost_center).permit(:cost_center_id, :ctrl_name, :desc, :position, :payroll_id, :valid_to,
                                        :created_by_id, :updated_by_id, :purch_group_id)
  end
end
