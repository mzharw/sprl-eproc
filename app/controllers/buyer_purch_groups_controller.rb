class BuyerPurchGroupsController < ApplicationController
  before_action :set_buyer_purch_group, only: %i[ show edit update destroy ]

  # GET /buyer_purch_groups or /buyer_purch_groups.json
  def index
    @buyer_purch_groups = BuyerPurchGroup.all
  end

  # GET /buyer_purch_groups/1 or /buyer_purch_groups/1.json
  def show
  end

  # GET /buyer_purch_groups/new
  def new
    @buyer_purch_group = BuyerPurchGroup.new
  end

  # GET /buyer_purch_groups/1/edit
  def edit
  end

  # POST /buyer_purch_groups or /buyer_purch_groups.json
  def create
    @buyer_purch_group = BuyerPurchGroup.new(buyer_purch_group_params)

    respond_to do |format|
      if @buyer_purch_group.save
        format.html { redirect_to buyer_purch_group_url(@buyer_purch_group), notice: "Buyer purch group was successfully created." }
        format.json { render :show, status: :created, location: @buyer_purch_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @buyer_purch_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buyer_purch_groups/1 or /buyer_purch_groups/1.json
  def update
    respond_to do |format|
      if @buyer_purch_group.update(buyer_purch_group_params)
        format.html { redirect_to buyer_purch_group_url(@buyer_purch_group), notice: "Buyer purch group was successfully updated." }
        format.json { render :show, status: :ok, location: @buyer_purch_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @buyer_purch_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buyer_purch_groups/1 or /buyer_purch_groups/1.json
  def destroy
    @buyer_purch_group.destroy!

    respond_to do |format|
      format.html { redirect_to buyer_purch_groups_url, notice: "Buyer purch group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buyer_purch_group
      @buyer_purch_group = BuyerPurchGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def buyer_purch_group_params
      params.require(:buyer_purch_group).permit(:buyer, :purch_group, :from_date, :thru_date, :created_at, :updated_at, :created_by_id, :updated_by_id)
    end
end
