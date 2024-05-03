class CreateRegions < ActiveRecord::Migration[7.1]
  def change
    create_table :regions, id: :uuid do |t|
      t.string :region_type
      t.uuid :parent_id
      t.string :code
      t.string :name
      t.string :postal_code
      t.uuid :created_by_id
      t.uuid :updated_by_id

      t.timestamps
    end
  end
end
