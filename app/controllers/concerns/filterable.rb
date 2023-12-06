module Filterable
  extend ActiveSupport::Concern

  private

  def sortable(model)
    order_by = params[:by] || 'created_at'
    @order_dir = params[:dir]
    @order_by = order_by.split('.').length > 1 ? order_by : "#{model.table_name}.#{order_by}"
  end
end
