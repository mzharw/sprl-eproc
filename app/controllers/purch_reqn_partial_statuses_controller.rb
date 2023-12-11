class PurchReqnPartialStatusesController < ApplicationController
  before_action :set_purch_reqn_partial_status, only: %i[ show edit update destroy ]

  # GET /purch_reqn_partial_statuses or /purch_reqn_partial_statuses.json
  def index
    @purch_reqn_partial_statuses = PurchReqnPartialStatus.all
  end

  # GET /purch_reqn_partial_statuses/1 or /purch_reqn_partial_statuses/1.json
  def show
  end

  # GET /purch_reqn_partial_statuses/new
  def new
    @purch_reqn_partial_status = PurchReqnPartialStatus.new
  end

  # GET /purch_reqn_partial_statuses/1/edit
  def edit
  end

  # POST /purch_reqn_partial_statuses or /purch_reqn_partial_statuses.json
  def create
    @purch_reqn_partial_status = PurchReqnPartialStatus.new(purch_reqn_partial_status_params)

    respond_to do |format|
      if @purch_reqn_partial_status.save
        format.html { redirect_to purch_reqn_partial_status_url(@purch_reqn_partial_status), notice: "Purch reqn partial status was successfully created." }
        format.json { render :show, status: :created, location: @purch_reqn_partial_status }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purch_reqn_partial_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purch_reqn_partial_statuses/1 or /purch_reqn_partial_statuses/1.json
  def update
    respond_to do |format|
      if @purch_reqn_partial_status.update(purch_reqn_partial_status_params)
        format.html { redirect_to purch_reqn_partial_status_url(@purch_reqn_partial_status), notice: "Purch reqn partial status was successfully updated." }
        format.json { render :show, status: :ok, location: @purch_reqn_partial_status }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purch_reqn_partial_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purch_reqn_partial_statuses/1 or /purch_reqn_partial_statuses/1.json
  def destroy
    @purch_reqn_partial_status.destroy!

    respond_to do |format|
      format.html { redirect_to purch_reqn_partial_statuses_url, notice: "Purch reqn partial status was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purch_reqn_partial_status
      @purch_reqn_partial_status = PurchReqnPartialStatus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purch_reqn_partial_status_params
      params.require(:purch_reqn_partial_status).permit(:purch_reqn_partial_id, :partialable_type, :partialable_id, :partial_itemable_type, :partial_itemable_id, :status, :created_by_id, :updated_by_id)
    end
end
