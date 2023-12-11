class PurchReqnLinkTypesController < ApplicationController
  before_action :set_purch_reqn_link_type, only: %i[ show edit update destroy ]

  # GET /purch_reqn_link_types or /purch_reqn_link_types.json
  def index
    @purch_reqn_link_types = PurchReqnLinkType.all
  end

  # GET /purch_reqn_link_types/1 or /purch_reqn_link_types/1.json
  def show
  end

  # GET /purch_reqn_link_types/new
  def new
    @purch_reqn_link_type = PurchReqnLinkType.new
  end

  # GET /purch_reqn_link_types/1/edit
  def edit
  end

  # POST /purch_reqn_link_types or /purch_reqn_link_types.json
  def create
    @purch_reqn_link_type = PurchReqnLinkType.new(purch_reqn_link_type_params)

    respond_to do |format|
      if @purch_reqn_link_type.save
        format.html { redirect_to purch_reqn_link_type_url(@purch_reqn_link_type), notice: "Purch reqn link type was successfully created." }
        format.json { render :show, status: :created, location: @purch_reqn_link_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purch_reqn_link_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purch_reqn_link_types/1 or /purch_reqn_link_types/1.json
  def update
    respond_to do |format|
      if @purch_reqn_link_type.update(purch_reqn_link_type_params)
        format.html { redirect_to purch_reqn_link_type_url(@purch_reqn_link_type), notice: "Purch reqn link type was successfully updated." }
        format.json { render :show, status: :ok, location: @purch_reqn_link_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purch_reqn_link_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purch_reqn_link_types/1 or /purch_reqn_link_types/1.json
  def destroy
    @purch_reqn_link_type.destroy!

    respond_to do |format|
      format.html { redirect_to purch_reqn_link_types_url, notice: "Purch reqn link type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purch_reqn_link_type
      @purch_reqn_link_type = PurchReqnLinkType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purch_reqn_link_type_params
      params.require(:purch_reqn_link_type).permit(:ident_name, :name, :desc, :system, :created_by_id, :updated_by_id)
    end
end
