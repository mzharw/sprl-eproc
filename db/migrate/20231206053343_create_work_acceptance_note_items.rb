class CreateWorkAcceptanceNoteItems < ActiveRecord::Migration[7.1]
  def change
    create_table :work_acceptance_note_items, id: :uuid do |t|
      t.string :number
      t.uuid :work_acceptance_note_id
      t.uuid :parent_id
      t.uuid :purch_order_item_id
      t.uuid :commodity_list_id
      t.uuid :product_group_id
      t.uuid :product_id
      t.float :qty
      t.uuid :measurement_unit_id
      t.float :unit_price
      t.float :price_unit
      t.float :subtotal
      t.boolean :sales_taxable
      t.string :amount_type
      t.uuid :wbsproject_id
      t.uuid :cost_center_id
      t.uuid :from_currency_id
      t.float :from_amount
      t.uuid :to_currency_id
      t.uuid :to_amount
      t.date :delivery_date
      t.text :desc
      t.text :specification
      t.text :note
      t.jsonb :data
      t.timestamp :deleted_at
      t.float :process_qty
      t.float :process_unit_price

      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.timestamps
    end
    add_index :work_acceptance_note_items, :created_by_id
    add_index :work_acceptance_note_items, :updated_by_id
    add_index :work_acceptance_note_items, :work_acceptance_note_id
    add_index :work_acceptance_note_items, :purch_order_item_id
  end
end
