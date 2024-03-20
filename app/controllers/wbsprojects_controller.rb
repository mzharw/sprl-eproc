class WbsprojectsController < ApplicationController
  include UserTrackable
  include Filterable
  before_action :set_wbsproject, only: %i[ show edit update destroy ]

  # GET /wbsprojects or /wbsprojects.json
  def index
    @wbsprojects = selectable(Wbsproject.all, :wbs_id, '"desc"')
    json = paginate_json(@wbsprojects)
    @wbsprojects = filter(@wbsprojects, { description: '"desc"', afe_id: :wbs_id })
    authorize @wbsprojects
    @wbsprojects = paginate(@wbsprojects).decorate

    respond_to do |format|
      format.html
      format.json { render json: }
    end
  end

  # GET /wbsprojects/1 or /wbsprojects/1.json
  def show
  end

  # GET /wbsprojects/new
  def new
    @wbsproject = Wbsproject.new
  end

  # GET /wbsprojects/1/edit
  def edit
  end

  # POST /wbsprojects or /wbsprojects.json
  def create
    @wbsproject = Wbsproject.new(wbsproject_params)

    respond_to do |format|
      if @wbsproject.save
        format.html { redirect_to wbsproject_url(@wbsproject), notice: "Wbsproject was successfully created." }
        format.json { render :show, status: :created, location: @wbsproject }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wbsproject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wbsprojects/1 or /wbsprojects/1.json
  def update
    respond_to do |format|
      if @wbsproject.update(wbsproject_params)
        format.html { redirect_to wbsproject_url(@wbsproject), notice: "Wbsproject was successfully updated." }
        format.json { render :show, status: :ok, location: @wbsproject }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wbsproject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wbsprojects/1 or /wbsprojects/1.json
  def destroy
    @wbsproject.destroy!

    respond_to do |format|
      format.html { redirect_to wbsprojects_url, notice: "Wbsproject was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_wbsproject
    @wbsproject = WbsprojectDecorator.new(Wbsproject.find(params[:id]))
    authorize @wbsproject
  end

  # Only allow a list of trusted parameters through.
  def wbsproject_params
    params.require(:wbsproject).permit(:parent_id, :ctrl_name, :position, :payroll_id, :wbs_id, :desc, :object_number, :istat, :usr03, :short_status, :long_status, :pack_short_status, :pack_long_status, :created_by_id, :updated_by_id, :responsible_cc_id)
  end
end
