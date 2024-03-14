# frozen_string_literal: true

class PurchReqnsController < ApplicationController
  include Filterable
  include UserTrackable
  before_action :set_purch_reqn, only: %i[show edit update destroy remove_attachment]

  # GET /purch_reqns or /purch_reqns.json
  def index
    @purch_reqns = PurchReqn
                     .joins(:plant, :creator)
                     .select('purch_reqns.*, plants.code, users.username')
    @purch_reqns = set_scope(@purch_reqns, :plants, :purch_groups)
    json = paginate_json(@purch_reqns.all)
    @purch_reqns = filter(@purch_reqns, { plants_code: 'plants.code', created_by: 'users.username', desc: 'purch_reqns.desc' })

    @purch_reqns = paginate(@purch_reqns).decorate

    respond_to do |format|
      format.html
      format.json { render json: }
    end
  end

  # GET /purch_reqns/1 or /purch_reqns/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        svg_config = { color: "000",
                       shape_rendering: "crispEdges",
                       module_size: 3,
                       standalone: true,
                       use_path: true }

        qr_purch_reqn = RQRCode::QRCode.new(purch_reqn_url)
        @qr_purch_reqn = qr_purch_reqn.as_svg(**svg_config)

        @approver_qrs = {}
        @purch_reqn.workflow_approver.each do |id|
          unless id.nil?
            qr = RQRCode::QRCode.new(user_url(id:))
            @approver_qrs[id] = qr.as_svg(**svg_config)
          end
        end

        render pdf: 'purch_reqn',
               template: 'purch_reqns/pdf_purch_reqn',
               formats: [:html],
               disposition: :inline,
               layout: 'pdf'
      end
    end
  end

  # GET /purch_reqns/new
  def new
    @purch_reqn = PurchReqn.new
    authorize @purch_reqn
  end

  # GET /purch_reqns/1/edit
  def edit
    if @purch_reqn.submitted?
      respond_to do |format|
        format.html { redirect_to purch_reqn_url(@purch_reqn), notice: 'Purchase requisition was already submitted, unable to make changes.' }
      end
    end
  end

  # POST /purch_reqns or /purch_reqns.json
  def create
    @purch_reqn = PurchReqn.new({ **purch_reqn_params, **tracker, state: 'DRAFT' })
    @purch_reqn.purch_org_id = PurchOrg.first.id
    authorize @purch_reqn

    respond_to do |format|
      if @purch_reqn.save
        format.html { redirect_to purch_reqn_url(@purch_reqn), notice: 'Purchase requisition was successfully created.' }
        format.json { render :show, status: :created, location: @purch_reqn }
        format.turbo_stream do
          flash.now[:notice] = 'Purchase requisition was successfully created!'
          render turbo_stream: [
            turbo_stream.append('toasts', partial: 'shared/toast'),
          # turbo_stream.replace('form', partial: 'form', locals: { purch_reqn: PurchReqn.new })
          ]
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purch_reqn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purch_reqns/1 or /purch_reqns/1.json
  def update
    doc = PurchReqn.check_docs(purch_reqn_params)
    respond_to do |format|
      if @purch_reqn.submitted? && doc
        format.turbo_stream do
          flash.now[:alert] = 'This purchase requisition has already been submitted and is in process. Document updates are currently restricted at this stage.'
          render turbo_stream: turbo_stream.append('toasts', partial: 'shared/toast')
        end
      end

      if purch_reqn_params[:fund_source] == 'PROJECT_WBS'
        @purch_reqn.cost_center_id = nil
      end

      if @purch_reqn.update(purch_reqn_params)
        unless doc.blank?
          format.turbo_stream do
            flash.now[:notice] = 'Document was updated successfully'
            render turbo_stream: [
              turbo_stream.append('toasts', partial: 'shared/toast'),
              turbo_stream.replace(doc, partial: 'docs_form', locals: { model: @purch_reqn, name: doc }),
              turbo_stream.replace('submit-button', partial: 'show_submit_button', locals: { model: @purch_reqn }),
            ]
          end
        end
        @purch_reqn.items.each_with_index do |item, index|
          item.number = index + 1
          item.save
        end
        format.html { redirect_to purch_reqn_url(@purch_reqn), notice: 'Purchase requisition was successfully updated.' }
        format.json { render :show, status: :ok, location: @purch_reqn }
      else
        unless doc.blank?
          format.turbo_stream do
            flash.now[:alert] = 'Document was failed to update'
            render turbo_stream: [
              turbo_stream.append('toasts', partial: 'shared/toast')
            ]
          end
        end
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purch_reqn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purch_reqns/1 or /purch_reqns/1.json
  def destroy
    @purch_reqn.destroy!

    respond_to do |format|
      format.html { redirect_to purch_reqns_url, notice: 'Purch reqn was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def remove_attachment
    attachment_name = params[:attachment_name]
    attachment = @purch_reqn.send(attachment_name).find(params[:attachment_id])

    respond_to do |format|
      if attachment.purge
        format.turbo_stream do
          flash.now[:notice] = 'Document was removed successfully!'
          render turbo_stream: [
            turbo_stream.append('toasts', partial: 'shared/toast'),
            turbo_stream.replace(attachment_name, partial: 'docs_form', locals: { model: @purch_reqn, name: attachment_name }),
            turbo_stream.replace('submit-button', partial: 'show_submit_button', locals: { model: @purch_reqn }),
          ]
        end
        format.html { redirect_to purch_reqn_url(@purch_reqn), notice: 'Attachment was successfully deleted.' }
        format.json { render :show, status: :ok, location: @purch_reqn }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @purch_reqn.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purch_reqn
    @purch_reqn = set_tracker(PurchReqn, :plants, :purch_groups, redirect_path: purch_reqns_path)
    return if @purch_reqn.nil?

    @purch_reqn = PurchReqnDecorator.new(@purch_reqn)
  end

  # Only allow a list of trusted parameters through.
  def purch_reqn_params
    params.require(:purch_reqn)
          .permit(:desc, :state, :current_workflow_instance_id, :purch_org_id,
                  :purch_reqn_type, :contract, :purch_group_id, :plant_id, :cost_center_id,
                  :fund_source, :currency_id, :prior_to_id, :contract_title, :scope_of_work,
                  :justification, :budget_soure, :reason, :contract_type, :risk_category,
                  :explanation, :previous_contract_number, :previous_contract_title,
                  :local_of_content, :rejected_at, :cancel_remark,
                  :contract_reference_id, :prcmt_id,
                  contract_docs: [],
                  contract_ex_sp_docs: [],
                  memo_scm_manager_docs: [],
                  work_ex_plan_docs: [],
                  owner_estimate_docs: [],
                  tech_eval_method_docs: [],
                  det_landing_cost_docs: [],
                  inspect_eval_method_docs: [],
                  risk_assessment_docs: [],
                  justify_memo_docs: [],
                  res_util_justify_docs: [])
  end
end
