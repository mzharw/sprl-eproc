class ProductGroup < ApplicationRecord
  include ModelTrackable
  track_user
end
