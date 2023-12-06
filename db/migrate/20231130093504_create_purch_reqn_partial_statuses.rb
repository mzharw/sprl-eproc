class CreatePurchReqnPartialStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_partial_statuses, id: :uuid  do |t|
      t.uuid :purch_reqn_partial, null: false
      t.string :partialable_type
      t.uuid :partialable, null: false
      t.string :partial_itemable_type
      t.uuid :partial_itemable, null: false
      t.string :status
      t.uuid :created_by, null: false
      t.uuid :updated_by, null: false

      t.timestamps
    end
    add_index :purch_reqn_partial_statuses, :created_by
    add_index :purch_reqn_partial_statuses, :updated_by
  end
end
