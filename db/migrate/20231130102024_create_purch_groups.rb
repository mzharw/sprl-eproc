class CreatePurchGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_groups, id: :uuid do |t|
      t.uuid :party_id
      t.string :code
      t.date :from_date
      t.date :thru_date
      t.string :description
      t.uuid :created_by
      t.uuid :updated_by

      t.timestamps
    end
    add_index :purch_groups, :created_by
    add_index :purch_groups, :updated_by
  end
end
