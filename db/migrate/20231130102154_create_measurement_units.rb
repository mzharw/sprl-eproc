class CreateMeasurementUnits < ActiveRecord::Migration[7.1]
  def change
    create_table :measurement_units do |t|
      t.uuid :app_id
      t.string :ident_name
      t.string :name
      t.string :symbol
      t.text :desc

      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.string :dimid

      t.timestamps
    end
  end
end
