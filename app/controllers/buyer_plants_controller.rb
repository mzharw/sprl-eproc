class BuyerPlantsController < ApplicationController
  before_action :set_buyer_plant, only: %i[ show edit update destroy ]

  # GET /buyer_plants or /buyer_plants.json
  def index
    @buyer_plants = BuyerPlant.all
  end

  # GET /buyer_plants/1 or /buyer_plants/1.json
  def show
  end

  # GET /buyer_plants/new
  def new
    @buyer_plant = BuyerPlant.new
  end

  # GET /buyer_plants/1/edit
  def edit
  end

  # POST /buyer_plants or /buyer_plants.json
  def create
    @buyer_plant = BuyerPlant.new(buyer_plant_params)

    respond_to do |format|
      if @buyer_plant.save
        format.html { redirect_to buyer_plant_url(@buyer_plant), notice: "Buyer plant was successfully created." }
        format.json { render :show, status: :created, location: @buyer_plant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @buyer_plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buyer_plants/1 or /buyer_plants/1.json
  def update
    respond_to do |format|
      if @buyer_plant.update(buyer_plant_params)
        format.html { redirect_to buyer_plant_url(@buyer_plant), notice: "Buyer plant was successfully updated." }
        format.json { render :show, status: :ok, location: @buyer_plant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @buyer_plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buyer_plants/1 or /buyer_plants/1.json
  def destroy
    @buyer_plant.destroy!

    respond_to do |format|
      format.html { redirect_to buyer_plants_url, notice: "Buyer plant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buyer_plant
      @buyer_plant = BuyerPlant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def buyer_plant_params
      params.require(:buyer_plant).permit(:buyer, :plant, :from_date, :thru_date, :created_at, :updated_at, :created_by_id, :updated_by_id)
    end
end
