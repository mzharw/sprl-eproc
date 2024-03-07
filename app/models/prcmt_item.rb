class PrcmtItem < ApplicationRecord
  belongs_to :purch_reqn_item
  belongs_to :product_group, optional: true
  belongs_to :product, optional: true
  belongs_to :uom, class_name: "MeasurementUnit", foreign_key: :measurement_unit_id, optional: true

  has_one :purch_reqn, through: :purch_reqn_item
  has_one :purch_order_item

  scope :unpurchased, -> { left_joins(:purch_order_item).where(purch_order_items: { id: nil }) }
end
