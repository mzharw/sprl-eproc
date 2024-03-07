class CreatePurchOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_order_items, id: :uuid do |t|
      t.uuid :purch_order
      t.string :number
      t.uuid :purch_reqn_item
      t.uuid :prcmt_item
      t.uuid :product_group
      t.uuid :product
      t.float :qty
      t.uuid :measurement_unit
      t.decimal :unit_price
      t.float :price_unit
      t.decimal :subtotal
      t.text :desc
      t.text :specification
      t.text :note
      t.jsonb :data
      t.uuid :created_by
      t.uuid :updated_by
      t.date :delivery_date
      t.uuid :from_currency
      t.decimal :from_amount
      t.uuid :to_currency
      t.decimal :to_amount
      t.uuid :purch_order_item_type
      t.decimal :line_total
      t.boolean :sales_taxable
      t.string :ancestry
      t.integer :ancestry_depth
      t.string :amount_type
      t.integer :seq
      t.float :process_qty
      t.string :item_type
      t.uuid :parent
      t.uuid :wbsproject
      t.uuid :cost_center
      t.decimal :process_unit_price

      t.timestamps
    end
  end
end
