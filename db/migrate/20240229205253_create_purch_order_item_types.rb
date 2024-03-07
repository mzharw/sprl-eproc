class CreatePurchOrderItemTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_order_item_types, id: :uuid do |t|
      t.uuid :parent_id
      t.string :ident_name
      t.string :name
      t.text :desc
      t.string :sign
      t.integer :seq
      t.boolean :children_allowed
      t.boolean :sales_taxable
      t.boolean :system

      t.timestamps
    end
  end
end
