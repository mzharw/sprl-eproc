class PurchReqnPartial < ApplicationRecord
  belongs_to :app
  belongs_to :purch_reqn_item
  belongs_to :partialable
  belongs_to :partial_itemable
  belongs_to :created_by
  belongs_to :updated_by
end
