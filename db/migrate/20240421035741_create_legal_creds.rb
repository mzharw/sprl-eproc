class CreateLegalCreds < ActiveRecord::Migration[7.1]
  def change
    create_table :legal_creds, id: :uuid do |t|
      t.date :from_date
      t.date :thru_date
      t.string :company_head
      t.date :registration_date
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.uuid :legal_org_type_id
      t.uuid :legal_org_scale_id

      t.timestamps
    end
  end
end
