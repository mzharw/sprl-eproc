class WorkflowStep < ApplicationRecord
    belongs_to :workflow

    def self.is_last_step?
        WorkflowStep
    end
end
