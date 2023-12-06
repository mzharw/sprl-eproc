class CreatePlants < ActiveRecord::Migration[7.1]
  def change
    create_table :plants, id: :uuid do |t|
      t.uuid :facility_id
      t.string :code
      t.date :from_date
      t.date :thru_date
      t.uuid :owner_party_id
      t.uuid :created_by
      t.uuid :updated_by

      t.timestamps
    end
    add_index :plants, :created_by
    add_index :plants, :updated_by
  end
end
