class LegalOrgBoard < ApplicationRecord
  belongs_to :legal_org
  belongs_to :party
  belongs_to :legal_org_board_type

  has_many :vendor_registration_entries, as: :entryable
end
