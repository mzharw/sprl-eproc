class CreatePurchReqnCancellations < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_cancellations, id: :uuid do |t|
      t.uuid :purch_reqn, null: false
      t.uuid :current_workflow_instance, null: false
      t.string :state
      t.uuid :created_by, null: false
      t.uuid :updated_by, null: false

      t.timestamps
    end
    add_index :purch_reqn_cancellations, :created_by
    add_index :purch_reqn_cancellations, :updated_by
  end
end
