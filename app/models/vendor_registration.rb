class VendorRegistration < ApplicationRecord
  belongs_to :vendor
  has_many :vendor_registration_entries
end
