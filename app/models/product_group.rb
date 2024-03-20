class ProductGroup < ApplicationRecord
  include ModelTrackable
  track_user(true)

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
end
