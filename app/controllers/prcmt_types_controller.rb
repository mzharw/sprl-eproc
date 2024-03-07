class PrcmtTypesController < ApplicationController
  include Filterable
  before_action :set_prcmt_type, only: %i[ show edit update destroy ]

  # GET /prcmt_types or /prcmt_types.json
  def index
    @prcmt_types = selectable(PrcmtType, :name)
    @prcmt_types = filter(@prcmt_types)
    @prcmt_types = paginate(@prcmt_types).decorate
  end

  # GET /prcmt_types/1 or /prcmt_types/1.json
  def show
  end

  # GET /prcmt_types/new
  def new
    @prcmt_type = PrcmtType.new
  end

  # GET /prcmt_types/1/edit
  def edit
  end

  # POST /prcmt_types or /prcmt_types.json
  def create
    @prcmt_type = PrcmtType.new(prcmt_type_params)

    respond_to do |format|
      if @prcmt_type.save
        format.html { redirect_to prcmt_type_url(@prcmt_type), notice: "Prcmt type was successfully created." }
        format.json { render :show, status: :created, location: @prcmt_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prcmt_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prcmt_types/1 or /prcmt_types/1.json
  def update
    respond_to do |format|
      if @prcmt_type.update(prcmt_type_params)
        format.html { redirect_to prcmt_type_url(@prcmt_type), notice: "Prcmt type was successfully updated." }
        format.json { render :show, status: :ok, location: @prcmt_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prcmt_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prcmt_types/1 or /prcmt_types/1.json
  def destroy
    @prcmt_type.destroy!

    respond_to do |format|
      format.html { redirect_to prcmt_types_url, notice: "Prcmt type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prcmt_type
      @prcmt_type = PrcmtType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prcmt_type_params
      params.require(:prcmt_type).permit(:ident_name, :name, :desc, :system, :visibility)
    end
end
