class CreatePurchReqnItemBuyers < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_item_buyers, id: :uuid do |t|
      t.uuid :purch_reqn_item, null: false
      t.uuid :buyer, null: false
      t.uuid :created_by, null: false
      t.uuid :updated_by, null: false

      t.timestamps
    end
  end
end
