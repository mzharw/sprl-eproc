class AddDefaultToStateInPurchOrders < ActiveRecord::Migration[7.1]
  def change
    change_column_default :purch_orders, :state, 'DRAFT'
  end
end
