class PurchReqnPartialStatus < ApplicationRecord

  belongs_to :purch_reqn_partial
  # belongs_to :partialable
  # belongs_to :partial_itemable

  include ModelTrackable
  track_user
end
