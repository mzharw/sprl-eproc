class Facility < ApplicationRecord
  include ModelTrackable
  has_one :party_facility

  track_user(true)
end
