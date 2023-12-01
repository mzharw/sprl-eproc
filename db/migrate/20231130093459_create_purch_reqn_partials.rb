class CreatePurchReqnPartials < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_partials do |t|
      t.references :app, null: false
      t.references :purch_reqn_item, null: false
      t.string :partialable_type
      t.references :partialable, null: false
      t.string :partial_itemable_type
      t.references :partial_itemable, null: false
      t.float :qty
      t.jsonb :data
      t.string :state
      t.references :created_by, null: false
      t.references :updated_by, null: false

      t.timestamps
    end
  end
end
