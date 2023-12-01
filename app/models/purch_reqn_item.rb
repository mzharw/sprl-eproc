class PurchReqnItem < ApplicationRecord
  belongs_to :app
  belongs_to :purch_reqn
  belongs_to :product_group
  belongs_to :product
  belongs_to :measurement_unit
  belongs_to :currency
  belongs_to :created_by
  belongs_to :updated_by
  belongs_to :deleted_by
  belongs_to :wbsproject
  belongs_to :parent
  belongs_to :contract_item_reference
  belongs_to :purch_reqn_item_noncontract
end
