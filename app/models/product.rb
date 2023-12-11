class Product < ApplicationRecord
  include ModelTrackable
  track_user

  belongs_to :measurement_unit
  belongs_to :product_group
end
