class ProductGroup < ApplicationRecord
  include ModelTrackable
  track_user(true)

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true

  scope :service, -> { where(is_service: true) }
  scope :material, -> { where(is_service: false) }
end
