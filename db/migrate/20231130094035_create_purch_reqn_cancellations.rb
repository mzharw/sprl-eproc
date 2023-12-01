class CreatePurchReqnCancellations < ActiveRecord::Migration[7.1]
  def change
    create_table :purch_reqn_cancellations do |t|
      t.references :app, null: false
      t.references :purch_reqn, null: false
      t.references :current_workflow_instance, null: false
      t.string :state
      t.references :created_by, null: false
      t.references :updated_by, null: false

      t.timestamps
    end
  end
end
