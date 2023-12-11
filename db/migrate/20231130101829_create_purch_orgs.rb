class CreatePurchOrgs < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_orgs, id: :uuid do |t|
      t.uuid :party_id
      t.string :code
      t.date :from_date
      t.date :thru_date
      t.uuid :created_by_id
      t.uuid :updated_by_id

      t.timestamps
    end
    add_index :purch_orgs, :created_by_id
    add_index :purch_orgs, :updated_by_id
  end
end
