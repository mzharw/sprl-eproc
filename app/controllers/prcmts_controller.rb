class PrcmtsController < ApplicationController
  before_action :set_prcmt, only: %i[ show edit update destroy ]

  # GET /prcmts or /prcmts.json
  def index
    @prcmts = Prcmt.all
  end

  # GET /prcmts/1 or /prcmts/1.json
  def show
  end

  # GET /prcmts/new
  def new
    @prcmt = Prcmt.new
  end

  # GET /prcmts/1/edit
  def edit
  end

  # POST /prcmts or /prcmts.json
  def create
    @prcmt = Prcmt.new(prcmt_params)

    respond_to do |format|
      if @prcmt.save
        format.html { redirect_to prcmt_url(@prcmt), notice: "Prcmt was successfully created." }
        format.json { render :show, status: :created, location: @prcmt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prcmt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prcmts/1 or /prcmts/1.json
  def update
    respond_to do |format|
      if @prcmt.update(prcmt_params)
        format.html { redirect_to prcmt_url(@prcmt), notice: "Prcmt was successfully updated." }
        format.json { render :show, status: :ok, location: @prcmt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prcmt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prcmts/1 or /prcmts/1.json
  def destroy
    @prcmt.destroy!

    respond_to do |format|
      format.html { redirect_to prcmts_url, notice: "Prcmt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prcmt
      @prcmt = Prcmt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prcmt_params
      params.require(:prcmt).permit(:app_id, :prcmt_type_id, :number, :name, :scope_of_work, :purch_org_id, :purch_group_id, :buyer_id, :prebid_meeting, :prequalification, :auction, :bid_submission_method, :quotation_media, :quotation_validity_days, :eval_method, :incoterm_id, :proposed_delivery_location, :purch_order_number, :contract_number, :data, :current_workflow_instance_id, :state, :created_at, :updated_at, :created_by_id, :updated_by_id, :bid_bond, :scope_of_supplies, :announced_at, :cancelled_at, :finished_at, :desc, :internal_remark, :candidate_selection_remark, :finish_remark, :prcmt_phase_evaluation_visibility, :cancel_remark, :aanwijzing_visibility, :bid_bond_visibility, :est_total, :prcmt_criterion_template_id, :internal_org_id, :plant_id, :assessment_method, :business_class, :business_field, :tkdn_percentage, :tender_location)
    end
end
