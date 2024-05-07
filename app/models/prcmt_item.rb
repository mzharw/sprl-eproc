class PrcmtItem < ApplicationRecord
  include ModelDryable

  belongs_to :purch_reqn_item
  belongs_to :product_group, optional: true
  belongs_to :product, optional: true
  belongs_to :uom, class_name: "MeasurementUnit", foreign_key: :measurement_unit_id, optional: true

  has_one :purch_reqn, through: :purch_reqn_item
  has_one :purch_order_item

  before_validation :validate_value

  validates :qty, numericality: { greater_than: 0 }
  validates :est_unit_price, numericality: { greater_than: 0 }

  scope :unpurchased, -> { left_joins(:purch_order_item).where(purch_order_items: { id: nil }) }

  private
  def validate_value
    self.qty = str_parser(qty)
    self.est_unit_price = str_parser(est_unit_price)
    # self.est_subtotal = self.qty * est_unit_price
  end
end
