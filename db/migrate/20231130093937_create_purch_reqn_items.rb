class CreatePurchReqnItems < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_items, id: :uuid do |t|
      t.uuid :purch_reqn_id
      t.string :number
      t.uuid :product_group_id
      t.uuid :product_id
      t.string :desired_vendor
      t.string :fixed_vendor
      t.decimal :qty, default: 0
      t.uuid :measurement_unit_id
      t.decimal :est_unit_price, default: 0
      t.float :price_unit, default: 0
      t.decimal :est_subtotal, default: 0
      t.uuid :currency_id
      t.string :requisitioner
      t.timestamp :expected_delivery_date
      t.text :desc
      t.json :data
      t.float :processed_qty
      t.text :specification
      t.text :note
      t.string :item_type
      t.uuid :wbsproject_id
      t.uuid :parent_id
      t.uuid :contract_item_reference_id
      t.boolean :contract_flag
      t.uuid :purch_reqn_item_noncontract_id
      t.uuid :commodity_list_id
      t.decimal :adjustment_qty

      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.uuid :discarded_by_id
      t.timestamp :discarded_at
      t.timestamps
    end

    add_index :purch_reqn_items, :purch_reqn_id
    add_index :purch_reqn_items, :discarded_at
    add_index :purch_reqn_items, :created_by_id
    add_index :purch_reqn_items, :updated_by_id
  end
end
