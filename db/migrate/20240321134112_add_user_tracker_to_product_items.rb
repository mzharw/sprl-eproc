class AddUserTrackerToProductItems < ActiveRecord::Migration[7.1]
  def change
    add_column :product_items, :created_by_id, :uuid
    add_column :product_items, :updated_by_id, :uuid
  end
end
