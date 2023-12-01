class CreatePurchReqnItems < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_items do |t|
      t.references :app, null: false
      t.references :purch_reqn, null: false
      t.string :number
      t.references :product_group, null: false
      t.references :product, null: false
      t.string :desired_vendor
      t.string :fixed_vendor
      t.decimal :qty
      t.references :measurement_unit, null: false
      t.decimal :est_unit_price
      t.float :price_unit
      t.decimal :est_subtotal
      t.references :currency, null: false
      t.string :requisitioner
      t.timestamp :expected_delivery_date
      t.text :desc
      t.jsonb :data
      t.references :created_by, null: false
      t.references :updated_by, null: false
      t.float :processed_qty
      t.text :specification
      t.text :note
      t.timestamp :deleted_at
      t.references :deleted_by, null: false
      t.string :item_type
      t.references :wbsproject, null: false
      t.references :parent, null: false
      t.references :contract_item_reference, null: false
      t.boolean :contract_flag
      t.references :purch_reqn_item_noncontract, null: false
      t.integer :commodity_list
      t.decimal :adjustment_qty

      t.timestamps
    end
  end
end
