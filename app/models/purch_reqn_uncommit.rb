class PurchReqnUncommit < ApplicationRecord
  belongs_to :app
  belongs_to :purch_reqn
  belongs_to :current_workflow_instance
  belongs_to :created_by
  belongs_to :updated_by
end
