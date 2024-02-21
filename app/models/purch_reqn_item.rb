class PurchReqnItem < ApplicationRecord
  include ModelTrackable
  track_user
  # track_number(:number, dependent: :purch_reqn_id)

  belongs_to :purch_reqn
  belongs_to :product_group, optional: true
  belongs_to :product, optional: true
  belongs_to :uom, class_name: "MeasurementUnit", foreign_key: :measurement_unit_id, optional: true
  belongs_to :currency, optional: true
  belongs_to :service, class_name: 'PurchReqnItem', foreign_key: :parent_id, optional: true
  has_many :service_items, class_name: 'PurchReqnItem', foreign_key: :parent_id
  before_validation :validate_all
  before_validation :validate_material, if: -> { item_type == 'MATERIAL' }
  before_validation :validate_service, if: -> { item_type == 'SERVICE' }
  before_validation :validate_service_item, if: -> { item_type == 'SERVICE_ITEM' }

  scope :without_service_item, -> { where.not(item_type: 'SERVICE_ITEM') }
  # belongs_to :deleted_by
  # belongs_to :wbsproject
  # belongs_to :parent
  # belongs_to :contract_item_reference
  # belongs_to :purch_reqn_item_noncontract

  private

  def validate_all
    errors.add(:desc, 'is required') unless desc.present?
  end

  def validate_qty
    errors.add(:uom, 'is required') unless uom.present?
    errors.add(:qty, 'is required') unless qty.present?
    errors.add(:est_unit_price, 'is required') unless est_unit_price.present?
  end

  def validate_stamps
    errors.add(:specification, 'is required') unless specification.present?
    errors.add(:requisitioner, 'is required') unless requisitioner.present?
    errors.add(:expected_delivery_date, 'is required') unless expected_delivery_date.present?
  end

  def validate_material
    errors.add(:product_group, 'is required') unless product_group.present?
    errors.add(:product, 'is required') unless product.present?
    validate_qty
    validate_stamps
  end

  def validate_service
    errors.add(:product_group, 'is required') unless product_group.present?
    validate_stamps
  end

  def validate_service_item
    validate_qty
  end
end
