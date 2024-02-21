class AddWorkflowStepIdFromWorkflowInstances < ActiveRecord::Migration[7.1]
  def change
    add_column :workflow_instances, :workflow_step_id, :uuid
  end
end
