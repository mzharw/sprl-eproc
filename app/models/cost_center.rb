class CostCenter < ApplicationRecord
  include ModelTrackable
  track_user(true)

  belongs_to :purch_group, optional: true
end
