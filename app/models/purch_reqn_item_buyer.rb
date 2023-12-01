class PurchReqnItemBuyer < ApplicationRecord
  belongs_to :app
  belongs_to :purch_reqn_item
  belongs_to :buyer
  belongs_to :created_by
  belongs_to :updated_by
end
