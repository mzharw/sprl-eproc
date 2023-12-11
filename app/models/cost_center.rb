class CostCenter < ApplicationRecord
  include ModelTrackable
  track_user

  belongs_to :purch_group
end
