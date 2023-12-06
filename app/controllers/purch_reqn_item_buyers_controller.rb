class PurchReqnItemBuyersController < ApplicationController
  before_action :set_purch_reqn_item_buyer, only: %i[ show edit update destroy ]

  # GET /purch_reqn_item_buyers or /purch_reqn_item_buyers.json
  def index
    @purch_reqn_item_buyers = PurchReqnItemBuyer.all
  end

  # GET /purch_reqn_item_buyers/1 or /purch_reqn_item_buyers/1.json
  def show
  end

  # GET /purch_reqn_item_buyers/new
  def new
    @purch_reqn_item_buyer = PurchReqnItemBuyer.new
  end

  # GET /purch_reqn_item_buyers/1/edit
  def edit
  end

  # POST /purch_reqn_item_buyers or /purch_reqn_item_buyers.json
  def create
    @purch_reqn_item_buyer = PurchReqnItemBuyer.new(purch_reqn_item_buyer_params)

    respond_to do |format|
      if @purch_reqn_item_buyer.save
        format.html { redirect_to purch_reqn_item_buyer_url(@purch_reqn_item_buyer), notice: "Purch reqn item buyer was successfully created." }
        format.json { render :show, status: :created, location: @purch_reqn_item_buyer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purch_reqn_item_buyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purch_reqn_item_buyers/1 or /purch_reqn_item_buyers/1.json
  def update
    respond_to do |format|
      if @purch_reqn_item_buyer.update(purch_reqn_item_buyer_params)
        format.html { redirect_to purch_reqn_item_buyer_url(@purch_reqn_item_buyer), notice: "Purch reqn item buyer was successfully updated." }
        format.json { render :show, status: :ok, location: @purch_reqn_item_buyer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purch_reqn_item_buyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purch_reqn_item_buyers/1 or /purch_reqn_item_buyers/1.json
  def destroy
    @purch_reqn_item_buyer.destroy!

    respond_to do |format|
      format.html { redirect_to purch_reqn_item_buyers_url, notice: "Purch reqn item buyer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purch_reqn_item_buyer
      @purch_reqn_item_buyer = PurchReqnItemBuyer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purch_reqn_item_buyer_params
      params.require(:purch_reqn_item_buyer).permit(:app_id, :purch_reqn_item_id, :buyer_id, :created_by, :updated_by)
    end
end
