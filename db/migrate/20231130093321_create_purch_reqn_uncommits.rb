class CreatePurchReqnUncommits < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_uncommits, id: :uuid do |t|
      t.uuid :purch_reqn, null: false
      t.string :desc
      t.text :uncommit_remark
      t.string :state
      t.uuid :current_workflow_instance, null: false
      t.uuid :created_by, null: false
      t.uuid :updated_by, null: false

      t.datetime :discarded_at
      t.timestamps
    end

    add_index :purch_reqn_uncommits, :discarded_at
    add_index :purch_reqn_uncommits, :purch_reqn
    add_index :purch_reqn_uncommits, :created_by
    add_index :purch_reqn_uncommits, :updated_by
  end
end
