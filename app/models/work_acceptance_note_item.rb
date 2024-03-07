class WorkAcceptanceNoteItem < ApplicationRecord
  belongs_to :uom, class_name: "MeasurementUnit", foreign_key: :measurement_unit_id, optional: true
  belongs_to :commodity_list
  belongs_to :product
  belongs_to :product_group
  belongs_to :cost_center
  belongs_to :purch_order_item
end
