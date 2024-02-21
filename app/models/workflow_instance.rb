class WorkflowInstance < ApplicationRecord
  include ModelTrackable
  default_scope { order(:created_at) }
  track_user(true)

  belongs_to :workflowable, polymorphic: true
  belongs_to :workflow_step, optional: true
  has_one :workflow, through: :workflow_step

  scope :passed, -> { where.not(updated_by_id: nil) }

  def finish_step(params, author)
    action = params[:action]
    comment = params[:comment]

    update_step(action, author, comment)

    case action
    when 'approve'
      next_step
    when 'reject'
      restart_step
    else
      false
    end
  end

  def update_step(action, author, comment = '')
    state = action.eql?('reject') ? 'REJECTED' : 'FINISHED'
    update(updated_by_id: author, state:, comment:)
  end

  private

  def next_step
    workflowable.advance_workflow(self)
  end

  def restart_step
    workflowable.advance_workflow(self, true)
  end
end
