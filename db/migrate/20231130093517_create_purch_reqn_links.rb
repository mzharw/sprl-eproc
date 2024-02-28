class CreatePurchReqnLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_links, id: :uuid  do |t|
      t.uuid :purch_reqn_link_type_id, null: false
      t.uuid :from_purch_reqn_id, null: false
      t.uuid :to_purch_reqn_id, null: false
      t.string :desc
      t.uuid :created_by_id
      t.uuid :updated_by_id

      t.timestamps
    end
    add_index :purch_reqn_links, :created_by_id
    add_index :purch_reqn_links, :updated_by_id
  end
end
