class CreateLegalOrgCreds < ActiveRecord::Migration[7.1]
  def change
    create_table :legal_org_creds, id: :uuid do |t|
      t.uuid :legal_org_id
      t.uuid :legal_org_cred_type_id
      t.string :number
      t.date :from_date
      t.date :thru_date
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.uuid :doc_id
      t.string :other_legal_org_cred_type

      t.timestamps
    end
  end
end
