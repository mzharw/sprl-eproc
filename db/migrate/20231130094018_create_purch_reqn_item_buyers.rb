class CreatePurchReqnItemBuyers < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_item_buyers, id: :uuid do |t|
      t.uuid :purch_reqn_item_id, null: false
      t.uuid :buyer_id, null: false
      t.uuid :created_by_id, null: false
      t.uuid :updated_by_id, null: false

      t.timestamps
    end
    add_index :purch_reqn_item_buyers, :created_by_id
    add_index :purch_reqn_item_buyers, :updated_by_id
  end
end
