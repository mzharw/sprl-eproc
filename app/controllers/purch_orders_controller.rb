class PurchOrdersController < ApplicationController
  before_action :set_purch_order, only: %i[ show edit update destroy ]
  include Filterable
  include UserTrackable

  # GET /purch_orders or /purch_orders.json
  def index
    @purch_orders = selectable(PurchOrder.joins(:purch_reqn_items, :purch_reqn).group('purch_orders.id', 'purch_reqns.number'), [:number, :desc], filter: 'purch_reqn_id')
    authorize @purch_orders
    @purch_orders = set_scope(@purch_orders, :purch_groups)
    json = paginate_json(@purch_orders.where.not(fully_approved_at: nil))

    @purch_orders = filter(@purch_orders, { number: 'purch_orders.number', pr_number: 'purch_reqns.number' })
    @purch_orders = paginate(@purch_orders).decorate

    respond_to do |format|
      format.html
      format.json { render json: }
    end
  end

  # GET /purch_orders/1 or /purch_orders/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        svg_config = { color: '000',
                       shape_rendering: 'crispEdges',
                       module_size: 3,
                       standalone: true,
                       use_path: true }

        qr_purch_order = RQRCode::QRCode.new(purch_order_url)
        @qr_purch_order = qr_purch_order.as_svg(**svg_config)

        @approver_qrs = {}
        @purch_order.workflow_approver.each do |id|
          unless id.nil?
            qr = RQRCode::QRCode.new(user_url(id:))
            @approver_qrs[id] = qr.as_svg(**svg_config)
          end
        end

        render pdf: "PO_#{@purch_order&.number}",
               template: 'purch_orders/pdf_purch_order',
               formats: [:html],
               disposition: :attachment,
               layout: 'pdf'
      end
    end
  end

  # GET /purch_orders/new
  def new
    @purch_order = PurchOrder.new
    @prcmt_items = nil
    prcmt_id = params[:prcmt_id]

    respond_to do |format|
      format.html
      format.turbo_stream do
        @prcmt_items = Prcmt.find(prcmt_id).prcmt_items.decorate unless prcmt_id.nil?
        render turbo_stream: [
          turbo_stream.update('prcmt_items', partial: 'prcmt_items/list')
        ]
      end
    end
  end

  # GET /purch_orders/1/edit
  def edit
  end

  # POST /purch_orders or /purch_orders.json
  def create
    @purch_order = PurchOrder.new({ **purch_order_params, **tracker })
    @purch_reqn_items = PurchReqnItem.committed.unpurchased.decorate
    items = PrcmtItem.where(id: purch_order_items_params)
    purch_reqn = items&.first&.purch_reqn

    @purch_order.purch_reqn_id = purch_reqn&.id
    @purch_order.purch_group_id = purch_reqn&.purch_group_id

    respond_to do |format|
      if @purch_order.save
        items.each do |item|
          PurchOrderItem.create({
                                  prcmt_item_id: item.id,
                                  purch_reqn_item_id: item.purch_reqn_item_id,
                                  purch_order_id: @purch_order.id,
                                  number: item.number,
                                  product_group_id: item.product_group_id,
                                  product_id: item.product_id,
                                  qty: item.qty,
                                  measurement_unit_id: item.measurement_unit_id,
                                  desc: item.desc,
                                  specification: item.specification,
                                  note: item.note,
                                  # wbsproject_id: item.wbsproject_id,
                                  data: item.data,
                                  # parent_id: item.parent_id,
                                  # item_type: item.item_type,
                                  delivery_date: item.expected_delivery_date,
                                  unit_price: item.est_unit_price,
                                  subtotal: item.est_subtotal,
                                  cost_center_id: purch_reqn.cost_center_id,
                                })
        end
        format.html { redirect_to purch_order_url(@purch_order), notice: "Purch order was successfully created." }
        format.json { render :show, status: :created, location: @purch_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purch_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purch_orders/1 or /purch_orders/1.json
  def update
    respond_to do |format|
      if @purch_order.update(purch_order_params)
        format.html { redirect_to purch_order_url(@purch_order), notice: "Purch order was successfully updated." }
        format.json { render :show, status: :ok, location: @purch_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purch_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purch_orders/1 or /purch_orders/1.json
  def destroy
    @purch_order.destroy!

    respond_to do |format|
      format.html { redirect_to purch_orders_url, notice: "Purch order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purch_order
    @purch_order = set_tracker(PurchOrder, :purch_groups, redirect_path: purch_orders_path)
    authorize @purch_order

    @purch_order = PurchOrderDecorator.new(@purch_order)
  end

  # Only allow a list of trusted parameters through.
  def purch_order_params
    params.require(:purch_order).permit(:purch_order_type_id, :number, :issued_date, :name, :incoterm_id, :incoterm_desc, :internal_org_id, :purch_org_id, :purch_group_id, :prcmt_id, :data, :state, :created_at, :updated_at, :created_by_id, :updated_by_id, :vendor_id, :referrable_type, :referrable_id, :payment_term_id, :delivery_location, :current_workflow_instance_id, :used_up, :finished_at, :discarded_at, :finished_by_id, :length_of_work, :payment_term_number, :payment_term_desc, :po_type, :contract, :validity_start_date, :commentcement_date, :delivery_detail, :remark, :scope_of_work, :po_to_amount, :account_holder, :account_number, :po_signing, :tax_policy, :to_currency_id, :rejected_at, :cost_center_id, :plant_id, :uncommit_remark, :is_replicated)
  end

  def purch_order_items_params
    params.require(:prcmt_items)
  end
end