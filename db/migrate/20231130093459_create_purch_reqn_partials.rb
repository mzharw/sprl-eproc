class CreatePurchReqnPartials < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_partials, id: :uuid  do |t|
      t.uuid :purch_reqn_item_id, null: false
      t.string :partialable_type
      t.uuid :partialable, null: false
      t.string :partial_itemable_type
      t.uuid :partial_itemable, null: false
      t.float :qty
      t.jsonb :data
      t.string :state
      t.uuid :created_by_id, null: false
      t.uuid :updated_by_id, null: false

      t.timestamp :discarded_at
      t.timestamps
    end

    add_index :purch_reqn_partials, :purch_reqn_item_id
    add_index :purch_reqn_partials, :discarded_at
    add_index :purch_reqn_partials, :created_by_id
    add_index :purch_reqn_partials, :updated_by_id
  end
end
