class ProductItem < ApplicationRecord
  include ModelTrackable
  track_user(true)

  default_scope { order(:number) }

  belongs_to :product
  belongs_to :uom, class_name: "MeasurementUnit", foreign_key: :measurement_unit_id, optional: true

  validates :number, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :number, uniqueness: { scope: :product_id, message: "must be unique for each product" }

  validates :unit_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true
end
