# frozen_string_literal: true

class WorkAcceptanceNotesController < ApplicationController
  before_action :set_work_acceptance_note, only: %i[show edit update destroy remove_attachment]
  include UserTrackable
  include Filterable

  # GET /work_acceptance_notes or /work_acceptance_notes.json
  def index
    @work_acceptance_notes = selectable(WorkAcceptanceNote.joins(:purch_reqn))
    @work_acceptance_notes = set_scope(@work_acceptance_notes, :purch_groups)
    @work_acceptance_notes = filter(@work_acceptance_notes, { title: 'name', pr_number: 'purch_reqns.number' })
    json = paginate_json(@work_acceptance_notes)

    @work_acceptance_notes = paginate(@work_acceptance_notes).decorate

    respond_to do |format|
      format.html
      format.json { render json: }
    end
  end

  # GET /work_acceptance_notes/1 or /work_acceptance_notes/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        svg_config = { color: '000',
                       shape_rendering: 'crispEdges',
                       module_size: 3,
                       standalone: true,
                       use_path: true }

        qr_wan = RQRCode::QRCode.new(work_acceptance_note_url)
        @qr_wan = qr_wan.as_svg(**svg_config)

        @approver_qrs = {}
        @work_acceptance_note.workflow_approver.each do |id|
          unless id.nil?
            qr = RQRCode::QRCode.new(user_url(id:))
            @approver_qrs[id] = qr.as_svg(**svg_config)
          end
        end

        render pdf: "WAN_#{@work_acceptance_note&.number}",
               template: 'work_acceptance_notes/pdf_wan',
               formats: [:html],
               disposition: :inline,
               layout: 'pdf'
      end
    end
  end

  # GET /work_acceptance_notes/new
  def new
    @work_acceptance_note = WorkAcceptanceNote.new
    purch_order_id = params[:purch_order_id]

    respond_to do |format|
      format.html
      format.turbo_stream do
        @purch_order_items = PurchOrder.find(purch_order_id).purch_order_items.decorate unless purch_order_id.nil?
        render turbo_stream: [
          turbo_stream.update('purch_order_items', partial: 'purch_order_items/list')
        ]
      end
    end
  end

  # GET /work_acceptance_notes/1/edit
  def edit; end

  # POST /work_acceptance_notes or /work_acceptance_notes.json
  def create
    items = PurchOrderItem.where(id: params[:purch_order_items])
    purch_reqn = items.first&.purch_reqn
    @work_acceptance_note = WorkAcceptanceNote.new({ **work_acceptance_note_params, **tracker,
                                                     plant_id: purch_reqn&.plant_id, purch_group_id: purch_reqn&.purch_group_id, purch_reqn_id: purch_reqn&.id })

    respond_to do |format|
      if @work_acceptance_note.save
        items.each do |item|
          WorkAcceptanceNoteItem.create({
                                          work_acceptance_note_id: @work_acceptance_note.id,
                                          purch_order_item_id: item.id,
                                          commodity_list_id: item.purch_reqn_item.commodity_list_id,
                                          product_group_id: item.product_group_id,
                                          product_id: item.product_id,
                                          number: item.number,
                                          qty: item.qty,
                                          measurement_unit_id: item.measurement_unit_id,
                                          unit_price: item.unit_price,
                                          subtotal: item.subtotal,
                                          cost_center_id: purch_reqn&.cost_center_id,
                                          delivery_date: item.delivery_date,
                                          desc: item.desc,
                                          specification: item.specification,
                                          note: item.note,
                                          data: item.data
                                          # wbsproject_id: item.wbsproject_id,
                                          # parent_id: item.parent_id,
                                          # item_type: item.item_type,
                                        })
        end
        format.html do
          redirect_to work_acceptance_note_url(@work_acceptance_note),
                      notice: 'Work acceptance note was successfully created.'
        end
        format.json { render :show, status: :created, location: @work_acceptance_note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @work_acceptance_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_acceptance_notes/1 or /work_acceptance_notes/1.json
  def update
    doc = WorkAcceptanceNote.check_docs(work_acceptance_note_params) unless work_acceptance_note_params.nil?

    respond_to do |format|
      if !work_acceptance_note_params.nil? && @work_acceptance_note.update(work_acceptance_note_params)
        format.turbo_stream do
          if work_acceptance_note_params.has_key?(:remark)
            flash.now[:notice] = 'Work acceptance note was successfully updated.'
          else
            if doc.nil?
              flash.now[:alert] = 'Please upload at least one document to proceed'
            else
              flash.now[:notice] = 'Document was updated successfully'
            end
          end
          render turbo_stream: [
            turbo_stream.append('toasts', partial: 'shared/toast'),
            turbo_stream.replace('attachment', partial: 'docs_form', locals: { model: @work_acceptance_note, name: 'attachment' }),
            turbo_stream.replace('submit-button', partial: 'show_submit_button', locals: { model: @work_acceptance_note }),
          ]
        end
        format.html do
          redirect_to work_acceptance_note_url(@work_acceptance_note),
                      notice: 'Work acceptance note was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @work_acceptance_note }
      else
        format.turbo_stream do
          if doc.nil?
            flash.now[:alert] = 'Please upload at least one document to proceed'
          else
            flash.now[:notice] = 'Document was updated successfully'
          end
          render turbo_stream: [
            turbo_stream.append('toasts', partial: 'shared/toast'),
            turbo_stream.replace('attachment', partial: 'docs_form', locals: { model: @work_acceptance_note, name: 'attachment' }),
            turbo_stream.replace('submit-button', partial: 'show_submit_button', locals: { model: @work_acceptance_note }),
          ]
        end
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @work_acceptance_note.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_attachment
    attachment_name = params[:attachment_name]
    attachment = @work_acceptance_note.send(attachment_name)

    respond_to do |format|
      attachment.purge
      # if attachment.purge
      format.turbo_stream do
        flash.now[:notice] = 'Document was removed successfully!'
        render turbo_stream: [
          turbo_stream.append('toasts', partial: 'shared/toast'),
          turbo_stream.replace(attachment_name, partial: 'docs_form', locals: { model: @work_acceptance_note, name: attachment_name }),
          turbo_stream.replace('submit-button', partial: 'show_submit_button', locals: { model: @work_acceptance_note }),
        ]
      end
      # format.html { redirect_to work_acceptance_notes_url(@work_acceptance_note), notice: 'Attachment was successfully deleted.' }
      # format.json { render :show, status: :ok, location: @work_acceptance_note }
      # else
      # format.html { render :show, status: :unprocessable_entity }
      # format.json { render json: @work_acceptance_note.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /work_acceptance_notes/1 or /work_acceptance_notes/1.json
  def destroy
    @work_acceptance_note.destroy!

    respond_to do |format|
      format.html { redirect_to work_acceptance_notes_url, notice: 'Work acceptance note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_work_acceptance_note
    @work_acceptance_note = set_tracker(WorkAcceptanceNote, :purch_groups, redirect_path: work_acceptance_notes_path)
    @work_acceptance_note = WorkAcceptanceNoteDecorator.new(@work_acceptance_note)
  end

  # Only allow a list of trusted parameters through.
  def work_acceptance_note_params
    if params.has_key?(:work_acceptance_note)
      params.require(:work_acceptance_note).permit(:number, :sap_number, :name, :state, :current_workflow_instance_id,
                                                   :data, :wan_type, :internal_org_id, :purch_org_id, :purch_group_id, :plant_id,
                                                   :purch_order_id, :vendor_id, :to_currency, :incoterm_id, :incoterm_desc,
                                                   :payment_term_number, :payment_term_desc, :request_type_code, :request_type,
                                                   :delivery_date, :desc, :receiver, :delivery_detail, :remark, :released_at,
                                                   :rejected_at, :discard_at, :cancel_remark, :reference_by_id, :attachment)
    end
  end
end
