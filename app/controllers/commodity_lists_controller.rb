class CommodityListsController < ApplicationController
  include UserTrackable
  before_action :set_commodity_list, only: %i[show edit update destroy]

  # GET /commodity_lists or /commodity_lists.json
  def index
    query = params[:query] || ''
    @commodity_lists = CommodityList.where('lower("desc") LIKE ?', "%#{query.downcase}%")

    respond_to do |format|
      format.html
      format.json { render json: @commodity_lists }
    end
  end

  # GET /commodity_lists/1 or /commodity_lists/1.json
  def show; end

  # GET /commodity_lists/new
  def new
    @commodity_list = CommodityList.new
  end

  # GET /commodity_lists/1/edit
  def edit; end

  # POST /commodity_lists or /commodity_lists.json
  def create
    @commodity_list = CommodityList.new({ **commodity_list_params, **tracker })

    respond_to do |format|
      if @commodity_list.save
        format.html do
          redirect_to commodity_list_url(@commodity_list), notice: 'Commodity list was successfully created.'
        end
        format.json { render :show, status: :created, location: @commodity_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @commodity_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commodity_lists/1 or /commodity_lists/1.json
  def update
    respond_to do |format|
      if @commodity_list.update(commodity_list_params)
        format.html do
          redirect_to commodity_list_url(@commodity_list), notice: 'Commodity list was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @commodity_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @commodity_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commodity_lists/1 or /commodity_lists/1.json
  def destroy
    @commodity_list.destroy!

    respond_to do |format|
      format.html { redirect_to commodity_lists_url, notice: 'Commodity list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_commodity_list
    @commodity_list = CommodityList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def commodity_list_params
    params.require(:commodity_list).permit(:commodity_list_id, :number, :desc, :created_by_id, :updated_by_id)
  end
end
