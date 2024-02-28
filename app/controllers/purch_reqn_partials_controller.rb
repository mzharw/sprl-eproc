class PurchReqnPartialsController < ApplicationController
  before_action :set_purch_reqn_partial, only: %i[ show edit update destroy ]

  # GET /purch_reqn_partials or /purch_reqn_partials.json
  def index
    @purch_reqn_partials = PurchReqnPartial.all
  end

  # GET /purch_reqn_partials/1 or /purch_reqn_partials/1.json
  def show
  end

  # GET /purch_reqn_partials/new
  def new
    @purch_reqn_partial = PurchReqnPartial.new
  end

  # GET /purch_reqn_partials/1/edit
  def edit
  end

  # POST /purch_reqn_partials or /purch_reqn_partials.json
  def create
    @purch_reqn_partial = PurchReqnPartial.new(purch_reqn_partial_params)

    respond_to do |format|
      if @purch_reqn_partial.save
        format.html { redirect_to purch_reqn_partial_url(@purch_reqn_partial), notice: "Purch reqn partial was successfully created." }
        format.json { render :show, status: :created, location: @purch_reqn_partial }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purch_reqn_partial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purch_reqn_partials/1 or /purch_reqn_partials/1.json
  def update
    respond_to do |format|
      if @purch_reqn_partial.update(purch_reqn_partial_params)
        format.html { redirect_to purch_reqn_partial_url(@purch_reqn_partial), notice: "Purch reqn partial was successfully updated." }
        format.json { render :show, status: :ok, location: @purch_reqn_partial }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purch_reqn_partial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purch_reqn_partials/1 or /purch_reqn_partials/1.json
  def destroy
    @purch_reqn_partial.destroy!

    respond_to do |format|
      format.html { redirect_to purch_reqn_partials_url, notice: "Purch reqn partial was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purch_reqn_partial
      @purch_reqn_partial = PurchReqnPartial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purch_reqn_partial_params
      params.require(:purch_reqn_partial).permit(:purch_reqn_item_id, :partialable_type, :partialable_id, :partial_itemable_type, :partial_itemable_id, :qty, :data, :state, :created_by_id, :updated_by_id)
    end
end
