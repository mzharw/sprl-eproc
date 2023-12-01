class PurchGroupsController < ApplicationController
  before_action :set_purch_group, only: %i[ show edit update destroy ]

  # GET /purch_groups or /purch_groups.json
  def index
    @purch_groups = PurchGroup.all
  end

  # GET /purch_groups/1 or /purch_groups/1.json
  def show
  end

  # GET /purch_groups/new
  def new
    @purch_group = PurchGroup.new
  end

  # GET /purch_groups/1/edit
  def edit
  end

  # POST /purch_groups or /purch_groups.json
  def create
    @purch_group = PurchGroup.new(purch_group_params)

    respond_to do |format|
      if @purch_group.save
        format.html { redirect_to purch_group_url(@purch_group), notice: "Purch group was successfully created." }
        format.json { render :show, status: :created, location: @purch_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purch_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purch_groups/1 or /purch_groups/1.json
  def update
    respond_to do |format|
      if @purch_group.update(purch_group_params)
        format.html { redirect_to purch_group_url(@purch_group), notice: "Purch group was successfully updated." }
        format.json { render :show, status: :ok, location: @purch_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purch_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purch_groups/1 or /purch_groups/1.json
  def destroy
    @purch_group.destroy!

    respond_to do |format|
      format.html { redirect_to purch_groups_url, notice: "Purch group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purch_group
      @purch_group = PurchGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purch_group_params
      params.require(:purch_group).permit(:app_id, :purch_order_type_id, :number, :issued_date, :name, :incoterm_id, :incoterm_desc, :internal_org_id, :purch_org_id, :purch_group_id, :prcmt_id, :data, :state, :created_at, :updated_at, :vendor_id, :referrable_type, :referrable_id, :payment_term_id, :delivery_location, :current_workflow_instance_id, :used_up, :finished_at, :discarded_at, :finished_by_id, :length_of_work, :payment_term_number, :payment_term_desc, :po_type, :contract, :validity_start_date, :commentcement_date, :delivery_detail, :remark, :scope_of_work, :po_to_amount, :account_holder, :account_number, :po_signing, :tax_policy, :to_currency_id, :rejected_at, :cost_center_id, :plant_id, :uncommit_remark, :is_replicated)
    end
end
