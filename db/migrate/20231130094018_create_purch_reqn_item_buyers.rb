class CreatePurchReqnItemBuyers < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_item_buyers do |t|
      t.references :app, null: false
      t.references :purch_reqn_item, null: false
      t.references :buyer, null: false
      t.references :created_by, null: false
      t.references :updated_by, null: false

      t.timestamps
    end
  end
end
