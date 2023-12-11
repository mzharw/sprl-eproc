class WorkAcceptanceNotesController < ApplicationController
  before_action :set_work_acceptance_note, only: %i[ show edit update destroy ]

  # GET /work_acceptance_notes or /work_acceptance_notes.json
  def index
    @work_acceptance_notes = WorkAcceptanceNote.all
  end

  # GET /work_acceptance_notes/1 or /work_acceptance_notes/1.json
  def show
  end

  # GET /work_acceptance_notes/new
  def new
    @work_acceptance_note = WorkAcceptanceNote.new
  end

  # GET /work_acceptance_notes/1/edit
  def edit
  end

  # POST /work_acceptance_notes or /work_acceptance_notes.json
  def create
    @work_acceptance_note = WorkAcceptanceNote.new(work_acceptance_note_params)

    respond_to do |format|
      if @work_acceptance_note.save
        format.html { redirect_to work_acceptance_note_url(@work_acceptance_note), notice: "Work acceptance note was successfully created." }
        format.json { render :show, status: :created, location: @work_acceptance_note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @work_acceptance_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_acceptance_notes/1 or /work_acceptance_notes/1.json
  def update
    respond_to do |format|
      if @work_acceptance_note.update(work_acceptance_note_params)
        format.html { redirect_to work_acceptance_note_url(@work_acceptance_note), notice: "Work acceptance note was successfully updated." }
        format.json { render :show, status: :ok, location: @work_acceptance_note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @work_acceptance_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_acceptance_notes/1 or /work_acceptance_notes/1.json
  def destroy
    @work_acceptance_note.destroy!

    respond_to do |format|
      format.html { redirect_to work_acceptance_notes_url, notice: "Work acceptance note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_acceptance_note
      @work_acceptance_note = WorkAcceptanceNote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_acceptance_note_params
      params.require(:work_acceptance_note).permit(:number, :sap_number, :name, :state, :current_workflow_instance_id, :data, :wan_type, :internal_org_id, :purch_org_id, :purch_group_id, :plant_id, :purch_order_id, :vendor_id, :to_currency, :incoterm_id, :incoterm_desc, :payment_term_number, :payment_term_desc, :request_type_code, :request_type, :delivery_date, :desc, :receiver, :delivery_detail, :remark, :released_at, :rejected_at, :discard_at, :cancel_remark, :reference_by_id)
    end
end
