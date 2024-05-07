class Bank < ApplicationRecord
  belongs_to :party
  belongs_to :bank_type
end
