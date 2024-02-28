class PurchOrg < ApplicationRecord
    belongs_to :party, optional: true
end
