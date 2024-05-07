class CreatePartyBankAccts < ActiveRecord::Migration[7.1]
  def change
    create_table :party_bank_accts, id: :uuid do |t|
      t.uuid :party_id
      t.uuid :bank_id
      t.string :branch_name
      t.string :acct_name
      t.string :acct_number
      t.date :from_date
      t.date :thru_date
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.uuid :currency_id

      t.timestamps
    end
  end
end
