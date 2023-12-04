class CreatePurchReqnItems < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_items, id: :uuid do |t|
      t.uuid :purch_reqn, null: false
      t.string :number
      t.uuid :product_group, null: false
      t.uuid :product, null: false
      t.string :desired_vendor
      t.string :fixed_vendor
      t.decimal :qty
      t.uuid :measurement_unit, null: false
      t.decimal :est_unit_price
      t.float :price_unit
      t.decimal :est_subtotal
      t.uuid :currency, null: false
      t.string :requisitioner
      t.timestamp :expected_delivery_date
      t.text :desc
      t.jsonb :data
      t.float :processed_qty
      t.text :specification
      t.text :note
      t.timestamp :deleted_at
      t.uuid :deleted_by, null: false
      t.string :item_type
      t.uuid :wbsproject, null: false
      t.uuid :parent, null: false
      t.uuid :contract_item_reference, null: false
      t.boolean :contract_flag
      t.uuid :purch_reqn_item_noncontract, null: false
      t.integer :commodity_list
      t.decimal :adjustment_qty

      t.uuid :created_by, null: false
      t.uuid :updated_by, null: false
      t.datetime :discarded_at
      t.timestamps
    end

    add_index :purch_reqn_items, :purch_reqn
    add_index :purch_reqn_items, :discarded_at
  end
end
