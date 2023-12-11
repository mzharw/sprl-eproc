class PurchReqnCancellation < ApplicationRecord

  belongs_to :purch_reqn
  # belongs_to :current_workflow_instance
  include ModelTrackable
  track_user
end
