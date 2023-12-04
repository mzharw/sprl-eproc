class CreatePurchReqnPartials < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_partials, id: :uuid  do |t|
      t.uuid :purch_reqn_item, null: false
      t.string :partialable_type
      t.uuid :partialable, null: false
      t.string :partial_itemable_type
      t.uuid :partial_itemable, null: false
      t.float :qty
      t.jsonb :data
      t.string :state
      t.uuid :created_by, null: false
      t.uuid :updated_by, null: false

      t.datetime :discarded_at
      t.timestamps
    end

    add_index :purch_reqn_partials, :purch_reqn_item
    add_index :purch_reqn_partials, :discarded_at
  end
end
