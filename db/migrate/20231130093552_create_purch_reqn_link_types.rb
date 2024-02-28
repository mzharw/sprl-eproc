class CreatePurchReqnLinkTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_link_types, id: :uuid  do |t|
      t.string :ident_name
      t.string :name
      t.text :desc
      t.boolean :system
      t.uuid :created_by_id, null: false
      t.uuid :updated_by_id, null: false

      t.timestamps
    end
    add_index :purch_reqn_link_types, :created_by_id
    add_index :purch_reqn_link_types, :updated_by_id
  end
end
