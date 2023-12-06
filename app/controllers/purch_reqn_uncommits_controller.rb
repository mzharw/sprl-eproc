class PurchReqnUncommitsController < ApplicationController
  before_action :set_purch_reqn_uncommit, only: %i[ show edit update destroy ]

  # GET /purch_reqn_uncommits or /purch_reqn_uncommits.json
  def index
    @purch_reqn_uncommits = PurchReqnUncommit.all
  end

  # GET /purch_reqn_uncommits/1 or /purch_reqn_uncommits/1.json
  def show
  end

  # GET /purch_reqn_uncommits/new
  def new
    @purch_reqn_uncommit = PurchReqnUncommit.new
  end

  # GET /purch_reqn_uncommits/1/edit
  def edit
  end

  # POST /purch_reqn_uncommits or /purch_reqn_uncommits.json
  def create
    @purch_reqn_uncommit = PurchReqnUncommit.new(purch_reqn_uncommit_params)

    respond_to do |format|
      if @purch_reqn_uncommit.save
        format.html { redirect_to purch_reqn_uncommit_url(@purch_reqn_uncommit), notice: "Purch reqn uncommit was successfully created." }
        format.json { render :show, status: :created, location: @purch_reqn_uncommit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purch_reqn_uncommit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purch_reqn_uncommits/1 or /purch_reqn_uncommits/1.json
  def update
    respond_to do |format|
      if @purch_reqn_uncommit.update(purch_reqn_uncommit_params)
        format.html { redirect_to purch_reqn_uncommit_url(@purch_reqn_uncommit), notice: "Purch reqn uncommit was successfully updated." }
        format.json { render :show, status: :ok, location: @purch_reqn_uncommit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purch_reqn_uncommit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purch_reqn_uncommits/1 or /purch_reqn_uncommits/1.json
  def destroy
    @purch_reqn_uncommit.destroy!

    respond_to do |format|
      format.html { redirect_to purch_reqn_uncommits_url, notice: "Purch reqn uncommit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purch_reqn_uncommit
      @purch_reqn_uncommit = PurchReqnUncommit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purch_reqn_uncommit_params
      params.require(:purch_reqn_uncommit).permit(:app_id, :purch_reqn_id, :desc, :uncommit_remark, :state, :current_workflow_instance_id, :created_by, :updated_by)
    end
end
