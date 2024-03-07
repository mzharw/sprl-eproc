class RefactorColumnNameOnPurchOrderItems < ActiveRecord::Migration[7.1]
  def change
    rename_column :purch_order_items, :purch_reqn_item, :purch_reqn_item_id
    rename_column :purch_order_items, :prcmt_item, :prcmt_item_id
    rename_column :purch_order_items, :product_group, :product_group_id
    rename_column :purch_order_items, :product, :product_id
    rename_column :purch_order_items, :measurement_unit, :measurement_unit_id
    rename_column :purch_order_items, :parent, :parent_id
    rename_column :purch_order_items, :wbsproject, :wbsproject_id
    rename_column :purch_order_items, :cost_center, :cost_center_id
  end
end
