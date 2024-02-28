class FacilitiesController < ApplicationController
  include UserTrackable
  include Filterable
  before_action :set_facility, only: %i[show edit update destroy]

  # GET /facilities or /facilities.json
  def index
    @facilities = selectable(Facility)
    @facilities = filter(@facilities)
    @facilities = @facilities.page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @facilities }
    end
  end

  # GET /facilities/1 or /facilities/1.json
  def show; end

  # GET /facilities/new
  def new
    @facility = Facility.new
  end

  # GET /facilities/1/edit
  def edit; end

  # POST /facilities or /facilities.json
  def create
    @facility = Facility.new({ **facility_params, **tracker })

    respond_to do |format|
      if @facility.save
        format.html { redirect_to facility_url(@facility), notice: 'Facility was successfully created.' }
        format.json { render :show, status: :created, location: @facility }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facilities/1 or /facilities/1.json
  def update
    respond_to do |format|
      if @facility.update(facility_params)
        format.html { redirect_to facility_url(@facility), notice: 'Facility was successfully updated.' }
        format.json { render :show, status: :ok, location: @facility }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facilities/1 or /facilities/1.json
  def destroy
    @facility.destroy!

    respond_to do |format|
      format.html { redirect_to facilities_url, notice: 'Facility was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_facility
    @facility = Facility.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def facility_params
    params.require(:facility).permit(:facility_type, :name, :created_at, :updated_at, :created_by_id, :updated_by_id)
  end
end
