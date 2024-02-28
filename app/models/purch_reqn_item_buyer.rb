class PurchReqnItemBuyer < ApplicationRecord

  belongs_to :purch_reqn_item
  belongs_to :buyer

  include ModelTrackable
  track_user
end
