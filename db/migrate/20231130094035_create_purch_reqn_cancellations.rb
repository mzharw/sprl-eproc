class CreatePurchReqnCancellations < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_cancellations, id: :uuid do |t|
      t.uuid :purch_reqn_id
      t.uuid :current_workflow_instance
      t.string :state, default: 'ACTIVE'
      t.uuid :created_by_id
      t.uuid :updated_by_id

      t.timestamps
    end
    add_index :purch_reqn_cancellations, :created_by_id
    add_index :purch_reqn_cancellations, :updated_by_id
  end
end
