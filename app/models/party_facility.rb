class PartyFacility < ApplicationRecord
  belongs_to :facility
  belongs_to :party
  belongs_to :party_facility_role

  has_many :vendor_registration_entries, as: :entryable
end
