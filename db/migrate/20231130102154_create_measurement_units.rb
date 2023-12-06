class CreateMeasurementUnits < ActiveRecord::Migration[7.1]
  def change
    create_table :measurement_units, id: :uuid do |t|
      t.uuid :app_id
      t.string :ident_name
      t.string :name
      t.string :symbol
      t.text :desc
      t.string :dimid
      
      t.uuid :created_by
      t.uuid :updated_by
      t.timestamps
    end
    add_index :measurement_units, :created_by
    add_index :measurement_units, :updated_by
  end
end
