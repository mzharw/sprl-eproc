class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products, id: :uuid do |t|
      t.uuid :app_id
      t.string :product_type
      t.uuid :product_group_id
      t.string :code
      t.string :name
      t.uuid :measurement_unit_id
      t.text :desc

      t.uuid :created_by
      t.uuid :updated_by
      t.timestamps
    end
    add_index :products, :created_by
    add_index :products, :updated_by
  end
end
