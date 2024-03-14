class CommodityList < ApplicationRecord
  include ModelTrackable
  track_user(true)
end
