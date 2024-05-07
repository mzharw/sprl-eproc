class CreateBanks < ActiveRecord::Migration[7.1]
  def change
    create_table :banks, id: :uuid do |t|
      t.uuid :party_id
      t.string :code
      t.date :from_date
      t.date :thru_date
      t.string :swift_code
      t.uuid :country_id
      t.string :other_country
      t.uuid :bank_type_id
      t.uuid :district_id
      t.string :other_district
      t.string :postal_address
      t.boolean :is_primary
      t.uuid :created_by_id
      t.uuid :updated_by_id

      t.timestamps
    end
  end
end
