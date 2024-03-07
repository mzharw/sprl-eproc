class RenamePurchOrderOnPurchOrderItems < ActiveRecord::Migration[7.1]
  def change
    rename_column :purch_order_items, :purch_order, :purch_order_id

  end
end
