class CreateProductItems < ActiveRecord::Migration[7.1]
  def change
    create_table :product_items, id: :uuid do |t|
      t.uuid :product_id
      t.uuid :measurement_unit_id
      t.text :description
      t.decimal :unit_price, default: 0

      t.timestamps
    end
  end
end
