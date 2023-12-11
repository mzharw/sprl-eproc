class PurchReqnItem < ApplicationRecord
  include ModelTrackable
  track_user
  # track_number(:number, dependent: :purch_reqn_id)

  belongs_to :purch_reqn
  belongs_to :product_group
  belongs_to :product
  belongs_to :uom, class_name: "MeasurementUnit", foreign_key: :measurement_unit_id
  belongs_to :currency

  # belongs_to :deleted_by
  # belongs_to :wbsproject
  # belongs_to :parent
  # belongs_to :contract_item_reference
  # belongs_to :purch_reqn_item_noncontract
end
