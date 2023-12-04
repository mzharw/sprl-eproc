class CreateFacilities < ActiveRecord::Migration[7.1]
  def change
    create_table :facilities do |t|
      t.string :facility_type
      t.string :name

      t.uuid :created_by
      t.uuid :updated_by
      t.datetime :discarded_at
      t.timestamps
    end

    add_index :facilities, :facility_type
    add_index :facilities, :discarded_at
  end
end
