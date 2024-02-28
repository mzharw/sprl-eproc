class WorkflowInstanceController < ApplicationController
  before_action :set_workflow_instance
  before_action :set_workflowable

  def update
    if @workflow_instance.finish_step(workflow_instance_params, current_user.id)
      redirect_to @workflowable, notice: 'Step completed successfully'
    else
      redirect_back fallback_location: @workflowable, alert: 'Error completing step'
    end
  end

  private

  def set_workflow_instance
    @workflow_instance = WorkflowInstance.find(params[:id])
  end

  def set_workflowable
    @workflowable = @workflow_instance.workflowable
  end

  def workflow_instance_params
    params.require(:workflow_instance).permit(:action, :comment)
  end

end