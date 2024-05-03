class CreatePartyFacilities < ActiveRecord::Migration[7.1]
  def change
    create_table :party_facilities, id: :uuid do |t|
      t.uuid :party_id
      t.uuid :facility_id
      t.uuid :party_facility_role_id
      t.boolean :is_primary
      t.date :from_date
      t.date :thru_date
      t.uuid :created_by_id
      t.uuid :updated_by_id

      t.timestamps
    end
  end
end
