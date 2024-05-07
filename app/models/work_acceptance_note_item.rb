class WorkAcceptanceNoteItem < ApplicationRecord
  belongs_to :uom, class_name: "MeasurementUnit", foreign_key: :measurement_unit_id, optional: true
  belongs_to :commodity_list
  belongs_to :product
  belongs_to :product_group
  belongs_to :cost_center, optional: true
  belongs_to :purch_order_item

  validates :qty, numericality: { greater_than: 0 }
  validates :unit_price, numericality: { greater_than: 0 }
end
