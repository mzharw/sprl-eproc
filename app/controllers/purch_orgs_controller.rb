class PurchOrgsController < ApplicationController
  before_action :set_purch_org, only: %i[ show edit update destroy ]

  # GET /purch_orgs or /purch_orgs.json
  def index
    query = params[:query] || ''
    @purch_orgs = PurchOrg.where('lower(code) LIKE ?', "%#{query.downcase}%")

    respond_to do |format|
      format.html
      format.json { render json: @purch_orgs }
    end
  end

  # GET /purch_orgs/1 or /purch_orgs/1.json
  def show
  end

  # GET /purch_orgs/new
  def new
    @purch_org = PurchOrg.new
  end

  # GET /purch_orgs/1/edit
  def edit
  end

  # POST /purch_orgs or /purch_orgs.json
  def create
    @purch_org = PurchOrg.new(purch_org_params)

    respond_to do |format|
      if @purch_org.save
        format.html { redirect_to purch_org_url(@purch_org), notice: "Purch org was successfully created." }
        format.json { render :show, status: :created, location: @purch_org }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purch_org.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purch_orgs/1 or /purch_orgs/1.json
  def update
    respond_to do |format|
      if @purch_org.update(purch_org_params)
        format.html { redirect_to purch_org_url(@purch_org), notice: "Purch org was successfully updated." }
        format.json { render :show, status: :ok, location: @purch_org }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purch_org.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purch_orgs/1 or /purch_orgs/1.json
  def destroy
    @purch_org.destroy!

    respond_to do |format|
      format.html { redirect_to purch_orgs_url, notice: "Purch org was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purch_org
      @purch_org = PurchOrg.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purch_org_params
      params.require(:purch_org).permit(:app_id, :party_id, :code, :from_date, :thru_date)
    end
end
