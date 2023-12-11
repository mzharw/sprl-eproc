class PurchReqnItemHistory < ApplicationRecord

  belongs_to :purch_reqn_item

  include ModelTrackable
  track_user
  #belongs_to :schedule
end
