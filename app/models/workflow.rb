class Workflow < ApplicationRecord
  has_many :workflow_steps

  def next_step(seq)
    workflow_steps.find_by(seq: seq + 1)
  end

  def first_step
    workflow_steps.find_by(seq: 0)
  end
end
