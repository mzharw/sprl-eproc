class PurchReqnItemsController < ApplicationController
  include UserTrackable
  before_action :set_purch_reqn_item, only: %i[show edit update destroy]

  # GET /purch_reqn_items or /purch_reqn_items.json
  def index
    @purch_reqn = PurchReqnDecorator.new(PurchReqn.find(params[:id]))
    items = carry_out_items_params[:items]
    if request.post? && !(items.nil? || items.empty?)
      redirect_to new_prcmt_path(purch_reqn: @purch_reqn, items: carry_out_items_params[:items])
    else
      flash.alert = "Please add atleast one item to carry out."
      @purch_reqn_items = PurchReqnItem.where(purch_reqn_id: params[:id]).without_service_item.decorate
    end
  end

  # GET /purch_reqn_items/1 or /purch_reqn_items/1.json
  def show; end

  # GET /purch_reqn_items/new
  def new
    @purch_reqn_item = PurchReqnItem.new
  end

  # GET /purch_reqn_items/1/edit
  def edit; end

  # POST /purch_reqn_items or /purch_reqn_items.json
  def create
    @purch_reqn_item = PurchReqnItem.new({ **purch_reqn_item_params, **tracker, purch_reqn_id: params[:id] })
    @purch_reqn_item.parent_id = params[:item_id] if (@purch_reqn_item.item_type == 'SERVICE_ITEM')
    if @purch_reqn_item.item_type == 'SERVICE'
      @purch_reqn_item.qty = 1
      # @purch_reqn_item.purch_group_id = ProductGroup.where(code: 'N').first
      @purch_reqn_item.measurement_unit_id = MeasurementUnit.find_by(ident_name: 'AU').id
    end

    respond_to do |format|
      if @purch_reqn_item.save
        if @purch_reqn_item.item_type == 'SERVICE_ITEM'
          service = @purch_reqn_item.service
          service.update(est_subtotal: service.service_items.sum(:est_subtotal))
        end
        format.html do
          notice = 'Items was sucessfully updated'
          if @purch_reqn_item.item_type == 'MATERIAL'
            redirect_to(purch_reqn_url(params[:id]), notice:)
          else
            redirect_to purch_reqn_item_path(item_id: @purch_reqn_item), notice:
          end
        end
        format.json { render :show, status: :created, location: @purch_reqn_item }
      else
        format.html { render action: :new, status: :unprocessable_entity }
        format.json { render json: @purch_reqn_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purch_reqn_items/1 or /purch_reqn_items/1.json
  def update
    respond_to do |format|
      if @purch_reqn_item.update({ **purch_reqn_item_params, **tracker(:update) })
        if @purch_reqn_item.item_type == 'SERVICE_ITEM'
          service = @purch_reqn_item.service
          service.update(est_subtotal: service.service_items.sum(:est_subtotal))
        end
        format.html do
          redirect_to purch_reqn_item_url(item_id: @purch_reqn_item), notice: 'Item was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @purch_reqn_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purch_reqn_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purch_reqn_items/1 or /purch_reqn_items/1.json
  def destroy
    @purch_reqn_item.destroy!

    respond_to do |format|
      if @purch_reqn_item.item_type == 'SERVICE_ITEM'
        service = @purch_reqn_item.service
        service.update(est_subtotal: service.service_items.sum(:est_subtotal))
      end
      notice = 'Purch reqn item was successfully removed.'
      format.turbo_stream do
        flash.now[:notice] = notice
        is_service_item = @purch_reqn_item.item_type == 'SERVICE_ITEM'
        items = is_service_item ? @purch_reqn_item.service.service_items.decorate : @purch_reqn_item.purch_reqn.decorated_items
        partial = is_service_item ? 'service_items' : 'list'
        stream = [turbo_stream.append('toasts', partial: 'shared/toast'),
                  turbo_stream.update('items', partial:, locals: { items: }, flush: true),
                  turbo_stream.update('purch_reqn', partial: 'purch_reqns/purch_reqn', locals: { purch_reqn: @purch_reqn_item.purch_reqn.decorate }, flush: true)
        ]
        stream = stream.push(turbo_stream.update('item_form', partial: 'form', locals: { purch_reqn_item: @purch_reqn_item.service.decorate }, flush: true)) if is_service_item
        render turbo_stream: stream
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purch_reqn_item
    @purch_reqn_item = PurchReqnItemDecorator.new(PurchReqnItem.find(params[:item_id]))
  end

  # Only allow a list of trusted parameters through.
  def purch_reqn_item_params
    params.require(:purch_reqn_item).permit(:purch_reqn_id, :number, :product_group_id, :product_id, :desired_vendor,
                                            :fixed_vendor, :qty, :measurement_unit_id, :est_unit_price, :price_unit, :est_subtotal, :currency_id, :requisitioner, :expected_delivery_date, :desc, :data, :created_by_id, :updated_by_id, :processed_qty, :specification, :note, :deleted_at, :deleted_by_id, :item_type, :wbsproject_id, :parent_id, :contract_item_reference_id, :contract_flag, :purch_reqn_item_noncontract_id, :commodity_list_id, :adjustment_qty)
  end

  def carry_out_items_params
    params.fetch(:purch_reqn_item, {}).permit(items: [])
  end
end
