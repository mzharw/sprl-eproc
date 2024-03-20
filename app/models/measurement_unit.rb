class MeasurementUnit < ApplicationRecord
  include ModelTrackable
  track_user(true)

  validates :symbol, presence: true
  validates :name, presence: true
end
