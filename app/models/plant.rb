class Plant < ApplicationRecord
    belongs_to :party, foreign_key: :owner_party_id
    belongs_to :facility
end
