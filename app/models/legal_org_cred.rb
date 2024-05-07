class LegalOrgCred < ApplicationRecord
  has_one_attached :doc
  belongs_to :legal_org
  belongs_to :legal_org_cred_type

  has_many :vendor_registration_entries, as: :entryable
end
