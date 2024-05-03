class VendorRegistrationEntry < ApplicationRecord
  belongs_to :entryable, polymorphic: true, optional: true
end
