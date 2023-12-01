class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.uuid :app_id
      t.string :product_type
      t.uuid :product_group_id
      t.string :code
      t.string :name
      t.uuid :measurement_unit_id

      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.text :desc

      t.timestamps
    end
  end
end
