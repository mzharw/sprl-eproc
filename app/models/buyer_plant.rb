class BuyerPlant < ApplicationRecord
  belongs_to :buyer
  belongs_to :plant
end
