class BuyersController < ApplicationController
  before_action :set_buyer, only: %i[ show edit update destroy ]
  include Filterable
  include UserTrackable
  # GET /buyers or /buyers.json
  def index
    @buyers = selectable(Buyer.joins(:party))
    @buyers = filter(@buyers, { name: 'parties.full_name' })
    @buyers = paginate(@buyers).decorate

    authorize @buyers.object
  end

  # GET /buyers/1 or /buyers/1.json
  def show
  end

  def new
    @buyer = Buyer.new
  end

  # GET /buyers/1/edit
  def edit
  end

  # POST /buyers or /buyers.json
  def create
    @buyer = Buyer.new(buyer_params)

    user_id = params[:buyer][:user_id]
    user = User.find(user_id) unless user_id.empty?
    @buyer.party_id = user&.party&.id
    @buyer.code = user&.username

    respond_to do |format|
      if @buyer.save
        format.html { redirect_to buyer_url(@buyer), notice: "Buyer was successfully created." }
        format.json { render :show, status: :created, location: @buyer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @buyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buyers/1 or /buyers/1.json
  def update
    purch_group_ids = purch_groups_params[:purch_group_ids] || []
    existing_purch_groups = @buyer.buyer_purch_groups.pluck(:purch_group_id)
    purch_groups_to_remove = existing_purch_groups - purch_group_ids
    new_purch_group_ids = purch_group_ids - existing_purch_groups

    if @buyer.buyer_purch_groups.where(purch_group_id: purch_groups_to_remove).delete_all
      new_purch_group_ids.each do |purch_group_id|
        @buyer.buyer_purch_groups.create(purch_group_id:)
      end
    end

    plant_ids = plants_params[:plant_ids] || []
    existing_plants = @buyer.buyer_plants.pluck(:plant_id)
    plants_to_remove = existing_plants - plant_ids
    new_plant_ids = plant_ids - existing_plants

    if @buyer.buyer_plants.where(plant_id: plants_to_remove).delete_all
      new_plant_ids.each do |plant_id|
        @buyer.buyer_plants.create(plant_id:)
      end
    end

    access_roles = access_roles_params
    access_roles.each do |role, state|
      state.to_i != 0 ? @buyer.user.add_role(role) : @buyer.user.remove_role(role)
    end

    respond_to do |format|
      if @buyer.update(buyer_params)
        format.html { redirect_to edit_buyer_url(@buyer), notice: "Buyer was successfully updated." }
        format.json { render :show, status: :ok, location: @buyer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @buyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buyers/1 or /buyers/1.json
  def destroy
    @buyer.destroy!

    respond_to do |format|
      format.html { redirect_to buyers_url, notice: "Buyer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_buyer
    @buyer = BuyerDecorator.new(Buyer.includes(:party).find(params[:id]))
    authorize @buyer.object
  end

  # Only allow a list of trusted parameters through.
  def buyer_params
    params.require(:buyer).permit(:party_id, :code, :from_date, :thru_date, :created_at, :updated_at, party_attributes: [:full_name])
  end

  def purch_groups_params
    params.require(:buyer).permit(purch_group_ids: [])
  end

  def plants_params
    params.require(:buyer).permit(plant_ids: [])
  end

  def access_roles_params
    params.require(:access_roles).permit!
  end
end
