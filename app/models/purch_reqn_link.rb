class PurchReqnLink < ApplicationRecord
  belongs_to :app
  belongs_to :purch_reqn_link_type
  belongs_to :from_purch_reqn
  belongs_to :to_purch_reqn
end
