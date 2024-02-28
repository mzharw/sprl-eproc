class CreateWorkflowSteps < ActiveRecord::Migration[7.1]
  def change
    create_table :workflow_steps, id: :uuid do |t|
      t.uuid :workflow_id
      t.string :name
      t.string :ident_name
      t.string :resource_name
      t.integer :seq
      t.json :opts
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.timestamp :discarded_at
      t.uuid :discarded_by_id

      t.timestamps
    end

    add_index :workflow_steps, :workflow_id
  end
end
