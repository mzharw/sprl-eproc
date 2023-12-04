class CreatePlants < ActiveRecord::Migration[7.1]
  def change
    create_table :plants, id: :uuid do |t|
      t.uuid :facility_id
      t.string :code
      t.date :from_date
      t.date :thru_date
      t.uuid :owner_party_id

      t.timestamps
    end
  end
end
