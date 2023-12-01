class PurchReqnCancellationsController < ApplicationController
  before_action :set_purch_reqn_cancellation, only: %i[ show edit update destroy ]

  # GET /purch_reqn_cancellations or /purch_reqn_cancellations.json
  def index
    @purch_reqn_cancellations = PurchReqnCancellation.all
  end

  # GET /purch_reqn_cancellations/1 or /purch_reqn_cancellations/1.json
  def show
  end

  # GET /purch_reqn_cancellations/new
  def new
    @purch_reqn_cancellation = PurchReqnCancellation.new
  end

  # GET /purch_reqn_cancellations/1/edit
  def edit
  end

  # POST /purch_reqn_cancellations or /purch_reqn_cancellations.json
  def create
    @purch_reqn_cancellation = PurchReqnCancellation.new(purch_reqn_cancellation_params)

    respond_to do |format|
      if @purch_reqn_cancellation.save
        format.html { redirect_to purch_reqn_cancellation_url(@purch_reqn_cancellation), notice: "Purch reqn cancellation was successfully created." }
        format.json { render :show, status: :created, location: @purch_reqn_cancellation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purch_reqn_cancellation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purch_reqn_cancellations/1 or /purch_reqn_cancellations/1.json
  def update
    respond_to do |format|
      if @purch_reqn_cancellation.update(purch_reqn_cancellation_params)
        format.html { redirect_to purch_reqn_cancellation_url(@purch_reqn_cancellation), notice: "Purch reqn cancellation was successfully updated." }
        format.json { render :show, status: :ok, location: @purch_reqn_cancellation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purch_reqn_cancellation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purch_reqn_cancellations/1 or /purch_reqn_cancellations/1.json
  def destroy
    @purch_reqn_cancellation.destroy!

    respond_to do |format|
      format.html { redirect_to purch_reqn_cancellations_url, notice: "Purch reqn cancellation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purch_reqn_cancellation
      @purch_reqn_cancellation = PurchReqnCancellation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purch_reqn_cancellation_params
      params.require(:purch_reqn_cancellation).permit(:app_id, :purch_reqn_id, :current_workflow_instance_id, :state, :created_by_id, :updated_by_id)
    end
end
