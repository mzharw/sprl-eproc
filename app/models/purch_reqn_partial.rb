class PurchReqnPartial < ApplicationRecord

  belongs_to :purch_reqn_item
  # belongs_to :partialable
  # belongs_to :partial_itemable

  include ModelTrackable
  track_user
end
