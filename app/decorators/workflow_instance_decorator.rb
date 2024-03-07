class WorkflowInstanceDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def comment
    first_step? ? 'Workflow Started' : object&.comment
  end

  def step
    first_step? ? 'Workflow Started' : object&.workflow_step&.name
  end

  def rejected?
    object.state.eql?('REJECTED')
  end

  def approver_position_name
    updater&.party&.personnel&.position_name
  end

  private

  def first_step?
    object.workflow_step&.seq&.zero?
  end

end
