class Vendor < ApplicationRecord
  belongs_to :party
  belongs_to :vendor_type
end
