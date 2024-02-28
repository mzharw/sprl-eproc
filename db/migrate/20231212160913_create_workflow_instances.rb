class CreateWorkflowInstances < ActiveRecord::Migration[7.1]
  def change
    create_table :workflow_instances, id: :uuid do |t|
      t.string :instance_number
      t.references :workflow, type: :uuid
      t.text :comment
      t.references :workflowable, type: :uuid, polymorphic: true
      t.string :state, default: 'ACTIVE'
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.timestamp :discarded_at
      t.uuid :discarded_by_id

      t.timestamps
    end
    add_index :workflow_instances, :instance_number
  end
end
