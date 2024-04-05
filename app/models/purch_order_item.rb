class PurchOrderItem < ApplicationRecord
  belongs_to :product_group, optional: true
  belongs_to :product, optional: true
  belongs_to :uom, class_name: "MeasurementUnit", foreign_key: :measurement_unit_id, optional: true
  belongs_to :purch_reqn_item

  validates :qty, numericality: { greater_than: 0 }
  validates :unit_price, numericality: { greater_than: 0 }

  has_one :purch_reqn, through: :purch_reqn_item
end
