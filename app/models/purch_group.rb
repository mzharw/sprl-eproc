class PurchGroup < ApplicationRecord
  include ModelTrackable
  track_user

  belongs_to :party
end
