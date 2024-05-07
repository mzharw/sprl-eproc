class PartyBankAcct < ApplicationRecord
  belongs_to :party
  belongs_to :bank
  belongs_to :currency

  has_many :vendor_registration_entries, as: :entryable
end
