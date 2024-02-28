class Facility < ApplicationRecord
  include ModelTrackable
  track_user
end
