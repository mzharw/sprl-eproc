class CreatePurchReqnUncommits < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_uncommits, id: :uuid do |t|
      t.uuid :purch_reqn_id, null: false
      t.string :desc
      t.text :uncommit_remark
      t.string :state
      t.uuid :current_workflow_instance, null: false
      t.uuid :created_by_id, null: false
      t.uuid :updated_by_id, null: false

      t.timestamp :discarded_at
      t.timestamps
    end

    add_index :purch_reqn_uncommits, :discarded_at
    add_index :purch_reqn_uncommits, :purch_reqn_id
    add_index :purch_reqn_uncommits, :created_by_id
    add_index :purch_reqn_uncommits, :updated_by_id
  end
end
