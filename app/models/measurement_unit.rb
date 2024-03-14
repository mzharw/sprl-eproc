class MeasurementUnit < ApplicationRecord
  include ModelTrackable
  track_user(true)
end
