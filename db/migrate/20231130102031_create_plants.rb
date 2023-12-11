class CreatePlants < ActiveRecord::Migration[7.1]
  def change
    create_table :plants, id: :uuid do |t|
      t.uuid :facility_id
      t.string :code
      t.date :from_date
      t.date :thru_date
      t.uuid :owner_party_id
      t.uuid :created_by_id
      t.uuid :updated_by_id

      t.timestamps
    end
    add_index :plants, :created_by_id
    add_index :plants, :updated_by_id
  end
end
