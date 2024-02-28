class CreateMeasurementUnits < ActiveRecord::Migration[7.1]
  def change
    create_table :measurement_units, id: :uuid do |t|
      t.string :ident_name
      t.string :name
      t.string :symbol
      t.text :desc
      t.string :dimid
      
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.timestamps
    end
    add_index :measurement_units, :created_by_id
    add_index :measurement_units, :updated_by_id
  end
end
