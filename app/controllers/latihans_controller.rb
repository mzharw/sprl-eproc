class LatihansController < ApplicationController
  before_action :set_latihan, only: %i[ show edit update destroy ]

  # GET /latihans or /latihans.json
  def index
    @latihans = Latihan.all
  end

  # GET /latihans/1 or /latihans/1.json
  def show
  end

  # GET /latihans/new
  def new
    @latihan = Latihan.new
  end

  # GET /latihans/1/edit
  def edit
  end

  # POST /latihans or /latihans.json
  def create
    @latihan = Latihan.new(latihan_params)

    respond_to do |format|
      if @latihan.save
        format.html { redirect_to latihan_url(@latihan), notice: "Latihan was successfully created." }
        format.json { render :show, status: :created, location: @latihan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @latihan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /latihans/1 or /latihans/1.json
  def update
    respond_to do |format|
      if @latihan.update(latihan_params)
        format.html { redirect_to latihan_url(@latihan), notice: "Latihan was successfully updated." }
        format.json { render :show, status: :ok, location: @latihan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @latihan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /latihans/1 or /latihans/1.json
  def destroy
    @latihan.destroy!

    respond_to do |format|
      format.html { redirect_to latihans_url, notice: "Latihan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_latihan
      @latihan = Latihan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def latihan_params
      params.require(:latihan).permit(:text)
    end
end
