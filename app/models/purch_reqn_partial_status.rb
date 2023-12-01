class PurchReqnPartialStatus < ApplicationRecord
  belongs_to :app
  belongs_to :purch_reqn_partial
  belongs_to :partialable
  belongs_to :partial_itemable
  belongs_to :created_by
  belongs_to :updated_by
end
