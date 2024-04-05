class AddNumberToProductItems < ActiveRecord::Migration[7.1]
  def change
    add_column :product_items, :number, :integer
  end
end
