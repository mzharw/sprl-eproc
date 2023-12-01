class PurchReqnLinkType < ApplicationRecord
  belongs_to :app
  belongs_to :created_by
  belongs_to :updated_by
end
