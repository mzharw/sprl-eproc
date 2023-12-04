class CreateMeasurementUnits < ActiveRecord::Migration[7.1]
  def change
    create_table :measurement_units, id: :uuid do |t|
      t.uuid :app_id
      t.string :ident_name
      t.string :name
      t.string :symbol
      t.text :desc

      t.uuid :created_by
      t.uuid :updated_by_id
      t.string :dimid

      t.timestamps
    end
  end
end
