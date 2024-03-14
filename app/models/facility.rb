class Facility < ApplicationRecord
  include ModelTrackable
  track_user(true)
end
