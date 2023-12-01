class PurchReqnItemHistory < ApplicationRecord
  belongs_to :app
  belongs_to :purch_reqn_item
  belongs_to :created_by
  belongs_to :updated_by
  belongs_to :schedule
end
