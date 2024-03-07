class AddApprovedTimestampsToPurchaseOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :purch_orders, :fully_approved_at, :timestamp
  end
end
