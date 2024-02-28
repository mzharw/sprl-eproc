class CreatePrcmtItems < ActiveRecord::Migration[7.1]
  def change
    create_table :prcmt_items, id: :uuid do |t|
      t.uuid :prcmt_id
      t.string :number
      t.uuid :purch_reqn_item_id
      t.uuid :product_group_id
      t.uuid :product_id
      t.string :desired_vendor
      t.string :fixed_vendor
      t.float :qty
      t.uuid :measurement_unit_id
      t.decimal :est_unit_price
      t.float :price_unit
      t.decimal :est_subtotal
      t.uuid :currency_id
      t.uuid :purch_group_id
      t.string :requisitioner
      t.timestamp :expected_delivery_date
      t.text :desc
      t.json :data
      t.text :specification
      t.text :note
      t.uuid :prcmt_award_item_id
      t.string :state
      t.timestamp :awarded_at
      t.boolean :po_processed

      t.timestamps
    end
  end
end
