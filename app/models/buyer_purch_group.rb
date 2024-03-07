class BuyerPurchGroup < ApplicationRecord
  belongs_to :buyer
  belongs_to :purch_group
end
