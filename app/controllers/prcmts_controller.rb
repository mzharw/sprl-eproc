# frozen_string_literal: true

class PrcmtsController < ApplicationController
  include Filterable
  include UserTrackable
  before_action :set_prcmt, only: %i[show edit update destroy]

  # GET /prcmts or /prcmts.json
  def index
    prcmt_item_ids = PrcmtItem.unpurchased.pluck(:id)
    @prcmts = selectable(Prcmt.joins(:purch_reqn_items, :prcmt_items).group('prcmts.id'), :number, :name, filter: 'purch_reqn_id', filter_map: { purch_reqn_id: 'purch_reqn_items.purch_reqn_id' })
    @prcmts = set_scope(@prcmts, :purch_groups)
    json = paginate_json(@prcmts.where(prcmt_items: { id: prcmt_item_ids }))
    @prcmts = filter(@prcmts, { number: 'prcmts.number', tender_name: 'prcmts.name' })
    authorize @prcmts

    @prcmts = paginate(@prcmts).decorate

    respond_to do |format|
      format.html
      format.json { render json: }
    end
  end

  # GET /prcmts/1 or /prcmts/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        svg_config = { color: '000',
                       shape_rendering: 'crispEdges',
                       module_size: 3,
                       standalone: true,
                       use_path: true }

        qr_prcmt = RQRCode::QRCode.new(prcmt_url)
        @qr_prcmt = qr_prcmt.as_svg(**svg_config)

        render pdf: "PRCMT_#{@prcmt&.number}",
               template: 'prcmts/pdf_prcmt',
               formats: [:html],
               disposition: :inline,
               layout: 'pdf'
      end
    end
  end

  # GET /prcmts/new
  def new
    purch_reqn_id = params[:purch_reqn]
    item_ids = params[:items]
    items_qty = params[:items_qty]

    unless item_ids.nil?
      @purch_reqn_items = PurchReqnItem.uncarried.where(id: item_ids).decorate

      error_items = {
        qty_not_found: [],
        zero_qty: [],
        exceeding_qty: []
      }

      error_messages = {
        qty_not_found: 'Item qty not found for item:',
        zero_qty: 'Carry-out qty cannot be zero for item:',
        exceeding_qty: 'The requested quantity exceeds the carriable qty for item:'
      }.freeze

      @prmct_items = {}
      @purch_reqn_items.each do |item|
        item_qty = items_qty[item.id]

        error_items[:qty_not_found].push(item.number) if item_qty.nil?
        error_items[:zero_qty].push(item.number) if item_qty.to_f.zero?
        error_items[:zero_qty].push(item.number) if (item.qty - item_qty.to_f).negative?

        @prmct_items[item.id] = item_qty unless item_qty.nil?
      end

      error_message = (error_messages.map do |k, m|
        items = error_items[k]
        items.empty? ? nil : "#{m} #{items.join(', ')}"
      end).reject(&:blank?).join('\n')

      @purch_reqn = PurchReqnDecorator.new(PurchReqn.find(purch_reqn_id)) unless purch_reqn_id.nil?
      unless @purch_reqn_items.empty? || error_message.blank?
        flash.alert = error_message
        redirect_to purch_reqn_items_path(@purch_reqn)
      end

    end

    redirect_back(fallback_location: root_path) if @purch_reqn.nil? || @purch_reqn_items.nil?

    @prcmt = Prcmt.new
  end

  # GET /prcmts/1/edit
  def edit; end

  # POST /prcmts or /prcmts.json
  def create
    @prcmt = Prcmt.new({ **prcmt_params, **tracker })
    @prmct_items = prcmt_items_params
    respond_to do |format|
      if @prcmt.save
        items = PurchReqnItem.where(id: prcmt_items_params.keys)
        items.each do |item|
          qty = prcmt_items_params[item.id]
          purch_reqn = item.purch_reqn
          PrcmtItem.create({
                             prcmt_id: @prcmt.id,
                             purch_reqn_item_id: item.id,
                             **item.serializable_hash(except: %i[id created_at updated_at
                             purch_reqn_id processed_qty item_type wbsproject_id parent_id
                             contract_item_reference_id contract_flag purch_reqn_item_noncontract_id
                             commodity_list_id adjustment_qty created_by_id updated_by_id
                             discarded_by_id discarded_at qty est_subtotal]),
                             est_subtotal: qty.to_f * item.est_unit_price.to_f,
                             currency_id: purch_reqn.currency_id,
                             purch_group_id: purch_reqn.purch_group_id,
                             qty:,
                           })
        end
        format.html { redirect_to prcmt_url(@prcmt), notice: 'Prcmt was successfully created.' }
        format.json { render :show, status: :created, location: @prcmt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prcmt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prcmts/1 or /prcmts/1.json
  def update
    respond_to do |format|
      if @prcmt.update(prcmt_params)
        format.html { redirect_to prcmt_url(@prcmt), notice: 'Prcmt was successfully updated.' }
        format.json { render :show, status: :ok, location: @prcmt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prcmt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prcmts/1 or /prcmts/1.json
  def destroy
    @prcmt.destroy!

    respond_to do |format|
      format.html { redirect_to prcmts_url, notice: 'Prcmt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_prcmt
    @prcmt = set_tracker(Prcmt, :purch_groups, redirect_path: prcmts_path)
    return if @prcmt.nil?

    authorize @prcmt
    @prcmt = PrcmtDecorator.new(@prcmt)
    @purch_reqn = @prcmt.purch_reqn.decorate
  end

  # Only allow a list of trusted parameters through.
  def prcmt_params
    params.require(:prcmt).permit(:prcmt_type_id, :number, :name, :scope_of_work, :purch_org_id, :purch_group_id,
                                  :buyer_id, :prebid_meeting, :prequalification, :auction, :bid_submission_method,
                                  :quotation_media, :quotation_validity_days, :eval_method, :incoterm_id,
                                  :proposed_delivery_location, :purch_order_number, :contract_number, :data,
                                  :current_workflow_instance_id, :state, :created_at, :updated_at, :created_by_id, :updated_by_id,
                                  :bid_bond, :scope_of_supplies, :announced_at, :cancelled_at, :finished_at, :desc, :internal_remark,
                                  :candidate_selection_remark, :finish_remark, :prcmt_phase_evaluation_visibility,
                                  :cancel_remark, :aanwijzing_visibility, :bid_bond_visibility, :est_total, :prcmt_criterion_template_id,
                                  :internal_org_id, :plant_id, :assessment_method, :business_class, :business_field, :tkdn_percentage,
                                  :tender_location)
  end

  def prcmt_items_params
    params.require(:prcmt_items).permit!
  end
end
