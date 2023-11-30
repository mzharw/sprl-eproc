class PurchReqnsController < ApplicationController
  before_action :set_purch_reqn, only: %i[ show edit update destroy ]

  # GET /purch_reqns or /purch_reqns.json
  def index
    @purch_reqns = PurchReqn.all
  end

  # GET /purch_reqns/1 or /purch_reqns/1.json
  def show
  end

  # GET /purch_reqns/new
  def new
    @purch_reqn = PurchReqn.new
  end

  # GET /purch_reqns/1/edit
  def edit
  end

  # POST /purch_reqns or /purch_reqns.json
  def create
    @purch_reqn = PurchReqn.new(purch_reqn_params)

    respond_to do |format|
      if @purch_reqn.save
        format.html { redirect_to purch_reqn_url(@purch_reqn), notice: "Purch reqn was successfully created." }
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
        format.html { redirect_to purch_reqn_url(@purch_reqn), notice: "Purch reqn was successfully updated." }
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
      format.html { redirect_to purch_reqns_url, notice: "Purch reqn was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purch_reqn
      @purch_reqn = PurchReqn.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purch_reqn_params
      params.require(:purch_reqn).permit(:app_id, :number, :desc, :created_by_id, :updated_by_id, :state, :current_workflow_instance_id, :purch_org_id, :purch_reqn_type, :contract, :purch_group_id, :plant_id, :cost_center_id, :fund_source, :currency_id, :recreate_from_id, :contract_title, :scope_of_work, :justification, :budget_soure, :reason, :contract_type, :risk_category, :explanation, :previous_contract_number, :previous_contract_title, :local_of_content, :rejected_at, :cancel_remark, :contract_reference_id, :prcmt_id)
    end
end
