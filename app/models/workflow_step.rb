class WorkflowStep < ApplicationRecord
    belongs_to :workflow
    default_scope { order(:seq) }

    def self.is_last_step?
        WorkflowStep
    end
end
