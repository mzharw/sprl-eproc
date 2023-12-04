class CreatePurchGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_groups, id: :uuid do |t|
      t.uuid :party_id
      t.string :code
      t.date :from_date
      t.date :thru_date
      t.string :description
      t.uuid :created_by
      t.uuid :updated_by_id

      t.timestamps
    end
  end
end
