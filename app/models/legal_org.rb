class LegalOrg < ApplicationRecord
  has_one_attached :justification_file
  has_one_attached :bank_statement_file

  belongs_to :party
  belongs_to :legal_org_type
  belongs_to :legal_org_scale, optional: true
end
