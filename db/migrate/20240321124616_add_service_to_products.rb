class AddServiceToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :is_service, :boolean, default: false
    add_column :product_groups, :is_service, :boolean, default: false
  end
end
