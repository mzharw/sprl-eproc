class CreateBuyerPurchGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :buyer_purch_groups, id: :uuid do |t|
      t.uuid :buyer_id
      t.uuid :purch_group_id
      t.date :from_date
      t.date :thru_date
      t.uuid :created_by_id
      t.uuid :updated_by_id

      t.timestamps
    end
  end
end
