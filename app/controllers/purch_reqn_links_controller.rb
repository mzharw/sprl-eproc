class PurchReqnLinksController < ApplicationController
  before_action :set_purch_reqn_link, only: %i[ show edit update destroy ]

  # GET /purch_reqn_links or /purch_reqn_links.json
  def index
    @purch_reqn_links = PurchReqnLink.all
  end

  # GET /purch_reqn_links/1 or /purch_reqn_links/1.json
  def show
  end

  # GET /purch_reqn_links/new
  def new
    @purch_reqn_link = PurchReqnLink.new
  end

  # GET /purch_reqn_links/1/edit
  def edit
  end

  # POST /purch_reqn_links or /purch_reqn_links.json
  def create
    @purch_reqn_link = PurchReqnLink.new(purch_reqn_link_params)

    respond_to do |format|
      if @purch_reqn_link.save
        format.html { redirect_to purch_reqn_link_url(@purch_reqn_link), notice: "Purch reqn link was successfully created." }
        format.json { render :show, status: :created, location: @purch_reqn_link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purch_reqn_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purch_reqn_links/1 or /purch_reqn_links/1.json
  def update
    respond_to do |format|
      if @purch_reqn_link.update(purch_reqn_link_params)
        format.html { redirect_to purch_reqn_link_url(@purch_reqn_link), notice: "Purch reqn link was successfully updated." }
        format.json { render :show, status: :ok, location: @purch_reqn_link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purch_reqn_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purch_reqn_links/1 or /purch_reqn_links/1.json
  def destroy
    @purch_reqn_link.destroy!

    respond_to do |format|
      format.html { redirect_to purch_reqn_links_url, notice: "Purch reqn link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purch_reqn_link
      @purch_reqn_link = PurchReqnLink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purch_reqn_link_params
      params.require(:purch_reqn_link).permit(:app_id, :purch_reqn_link_type_id, :from_purch_reqn_id, :to_purch_reqn_id, :desc)
    end
end
