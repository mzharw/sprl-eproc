class CreateProductGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :product_groups, id: :uuid do |t|
      t.string :code
      t.string :name
      t.text :desc
      t.uuid :created_by_id
      t.uuid :updated_by_id

      t.timestamps
    end
  end
end
