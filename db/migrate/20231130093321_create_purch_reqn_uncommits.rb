class CreatePurchReqnUncommits < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_uncommits do |t|
      t.references :app, null: false
      t.references :purch_reqn, null: false
      t.string :desc
      t.text :uncommit_remark
      t.string :state
      t.references :current_workflow_instance, null: false
      t.references :created_by, null: false
      t.references :updated_by, null: false

      t.timestamps
    end
  end
end
