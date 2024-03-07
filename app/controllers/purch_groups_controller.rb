class PurchGroupsController < ApplicationController
  include Filterable
  include UserTrackable
  include Partiable
  before_action :set_purch_group, only: %i[show edit update destroy]

  # GET /purch_groups or /purch_groups.json
  def index
    @purch_groups = selectable(PurchGroup.joins(:party), 'parties.full_name', :code)
    json_groups = current_user.is_superuser? ? @purch_groups : @purch_groups.where(id: current_user.purch_group_ids)
    json = paginate_json(json_groups, :id, :code, 'parties.full_name as name')
    @purch_groups = filter(@purch_groups, { name: 'parties.full_name' })
    @purch_groups = paginate(@purch_groups)

    respond_to do |format|
      format.html do
        authorize @purch_groups
      end
      format.json { render json: }
    end
  end

  # GET /purch_groups/1 or /purch_groups/1.json
  def show; end

  # GET /purch_groups/new
  def new
    @purch_group = PurchGroup.new
  end

  # GET /purch_groups/1/edit
  def edit; end

  # POST /purch_groups or /purch_groups.json
  def create
    party_id = org_party(purch_group_params[:name]).id
    @purch_group = PurchGroup.new({ **purch_group_params.except(:name), **tracker, party_id: })

    respond_to do |format|
      if @purch_group.save
        format.html { redirect_to purch_group_url(@purch_group), notice: 'Purch group was successfully created.' }
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
        format.html { redirect_to purch_group_url(@purch_group), notice: 'Purch group was successfully updated.' }
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
      format.html { redirect_to purch_groups_url, notice: 'Purch group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purch_group
    @purch_group = PurchGroup.includes(:party).find(params[:id])
    authorize @purch_group
  end

  # Only allow a list of trusted parameters through.
  def purch_group_params
    params.require(:purch_group).permit(:code, :from_date, :thru_date, :description, :name, party_attributes: [:full_name])
  end
end
