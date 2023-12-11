class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products, id: :uuid do |t|
      t.string :product_type
      t.uuid :product_group_id
      t.string :code
      t.string :name
      t.uuid :measurement_unit_id
      t.text :desc

      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.timestamps
    end
    add_index :products, :created_by_id
    add_index :products, :updated_by_id
  end
end
