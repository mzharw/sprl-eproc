class CreatePurchOrderTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_order_types, id: :uuid do |t|
      t.string :ident_name
      t.string :name
      t.text :desc
      t.boolean :system

      t.timestamps
    end
  end
end
