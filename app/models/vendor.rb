class Vendor < ApplicationRecord
  belongs_to :party, optional: true
  belongs_to :vendor_type

  validates :code, presence: true, uniqueness: true
end
