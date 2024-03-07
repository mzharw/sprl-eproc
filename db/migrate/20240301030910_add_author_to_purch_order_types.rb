class AddAuthorToPurchOrderTypes < ActiveRecord::Migration[7.1]
  def change
    add_column :purch_order_types, :created_by_id, :uuid
    add_column :purch_order_types, :updated_by_id, :uuid
  end
end
