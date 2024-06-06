class AddRejectedCommentToWorkflowInstancesTable < ActiveRecord::Migration[7.1]
  def change
    add_column :workflow_instances, :rejected_comment, :string
  end
end
