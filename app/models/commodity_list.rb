class CommodityList < ApplicationRecord
  include ModelTrackable
  track_user(true)

  validates :number, presence: true, uniqueness: true
  validates :description, presence: true
end
