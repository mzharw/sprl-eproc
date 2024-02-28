class PurchReqnItemHistoriesController < ApplicationController
  before_action :set_purch_reqn_item_history, only: %i[ show edit update destroy ]

  # GET /purch_reqn_item_histories or /purch_reqn_item_histories.json
  def index
    @purch_reqn_item_histories = PurchReqnItemHistory.all
  end

  # GET /purch_reqn_item_histories/1 or /purch_reqn_item_histories/1.json
  def show
  end

  # GET /purch_reqn_item_histories/new
  def new
    @purch_reqn_item_history = PurchReqnItemHistory.new
  end

  # GET /purch_reqn_item_histories/1/edit
  def edit
  end

  # POST /purch_reqn_item_histories or /purch_reqn_item_histories.json
  def create
    @purch_reqn_item_history = PurchReqnItemHistory.new(purch_reqn_item_history_params)

    respond_to do |format|
      if @purch_reqn_item_history.save
        format.html { redirect_to purch_reqn_item_history_url(@purch_reqn_item_history), notice: "Purch reqn item history was successfully created." }
        format.json { render :show, status: :created, location: @purch_reqn_item_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purch_reqn_item_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purch_reqn_item_histories/1 or /purch_reqn_item_histories/1.json
  def update
    respond_to do |format|
      if @purch_reqn_item_history.update(purch_reqn_item_history_params)
        format.html { redirect_to purch_reqn_item_history_url(@purch_reqn_item_history), notice: "Purch reqn item history was successfully updated." }
        format.json { render :show, status: :ok, location: @purch_reqn_item_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purch_reqn_item_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purch_reqn_item_histories/1 or /purch_reqn_item_histories/1.json
  def destroy
    @purch_reqn_item_history.destroy!

    respond_to do |format|
      format.html { redirect_to purch_reqn_item_histories_url, notice: "Purch reqn item history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purch_reqn_item_history
      @purch_reqn_item_history = PurchReqnItemHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purch_reqn_item_history_params
      params.require(:purch_reqn_item_history).permit(:purch_reqn_item_id, :desc, :username, :system, :created_by_id, :updated_by_id, :schedule_id, :finished_at)
    end
end
