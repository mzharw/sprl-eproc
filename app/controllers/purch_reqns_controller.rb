class PurchReqnsController < ApplicationController
  include Filterable
  include UserTrackable
  before_action :set_purch_reqn, only: %i[show edit update destroy remove_attachment]

  # GET /purch_reqns or /purch_reqns.json
  def index
    sortable(PurchReqn)
    @purch_reqns =  PurchReqn
    .joins(:plant)
    .select('purch_reqns.*, plants.code')
    .order("#{@order_by} #{@order_dir || ''}")
    .page
  end

  # GET /purch_reqns/1 or /purch_reqns/1.json
  def show; end

  # GET /purch_reqns/new
  def new
    @purch_reqn = PurchReqn.new
  end

  # GET /purch_reqns/1/edit
  def edit; end

  # POST /purch_reqns or /purch_reqns.json
  def create
    @purch_reqn = PurchReqn.new({ **purch_reqn_params, **tracker, state: 'DRAFT' })

    respond_to do |format|
      if @purch_reqn.save
        format.html { redirect_to purch_reqn_url(@purch_reqn), notice: 'Purch reqn was successfully created.' }
        format.json { render :show, status: :created, location: @purch_reqn }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purch_reqn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purch_reqns/1 or /purch_reqns/1.json
  def update
    respond_to do |format|
      if @purch_reqn.update(purch_reqn_params)
        format.html { redirect_to purch_reqn_url(@purch_reqn), notice: 'Purch reqn was successfully updated.' }
        format.json { render :show, status: :ok, location: @purch_reqn }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purch_reqn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purch_reqns/1 or /purch_reqns/1.json
  def destroy
    @purch_reqn.destroy!

    respond_to do |format|
      format.html { redirect_to purch_reqns_url, notice: 'Purch reqn was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def remove_attachment
    attachment = @purch_reqn.send(params[:attachment_name]).find(params[:attachment_id])

    respond_to do |format|
      if attachment.purge
        format.html { redirect_to purch_reqn_url(@purch_reqn), notice: 'Attachment was successfully deleted.' }
        format.json { render :show, status: :ok, location: @purch_reqn }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @purch_reqn.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purch_reqn
    @purch_reqn = PurchReqnDecorator.new(PurchReqn.find(params[:id]))
  end

  # Only allow a list of trusted parameters through.
  def purch_reqn_params
    params.require(:purch_reqn)
          .permit(:desc, :state, :current_workflow_instance_id, :purch_org_id,
                  :purch_reqn_type, :contract, :purch_group_id, :plant_id, :cost_center_id,
                  :fund_source, :currency_id, :recreate_from_id, :contract_title, :scope_of_work,
                  :justification, :budget_soure, :reason, :contract_type, :risk_category,
                  :explanation, :previous_contract_number, :previous_contract_title,
                  :local_of_content, :rejected_at, :cancel_remark,
                  :contract_reference_id, :prcmt_id,
                  contract_docs: [],
                  contract_ex_sp_docs: [],
                  memo_scm_manager_docs: [],
                  work_ex_plan_docs: [],
                  owner_estimate_docs: [],
                  tech_eval_method_docs: [],
                  det_landing_cost_docs: [],
                  inspect_eval_method_docs: [],
                  risk_assessment_docs: [],
                  justify_memo_docs: [],
                  res_util_justify_docs: [])
  end
end
