class CreatePurchReqnPartialStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_partial_statuses do |t|
      t.references :app, null: false
      t.references :purch_reqn_partial, null: false
      t.string :partialable_type
      t.references :partialable, null: false
      t.string :partial_itemable_type
      t.references :partial_itemable, null: false
      t.string :status
      t.references :created_by, null: false
      t.references :updated_by, null: false

      t.timestamps
    end
  end
end
