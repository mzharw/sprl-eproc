class AddNullableToUoms < ActiveRecord::Migration[7.1]
  def change
    change_column_null :measurement_units, :created_at, true
    change_column_null :measurement_units, :updated_at, true
  end
end
