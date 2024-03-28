class Product < ApplicationRecord
  include ModelTrackable
  track_user(true)

  belongs_to :measurement_unit
  belongs_to :product_group

  validates :code, presence: true, uniqueness: true
  validates :product_type, presence: true
  validates :name, presence: true

  has_many :product_items

  scope :service, -> { where(is_service: true) }
  scope :material, -> { where(is_service: false) }
end