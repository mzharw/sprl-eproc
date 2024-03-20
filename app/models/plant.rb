class Plant < ApplicationRecord
  belongs_to :party, foreign_key: :owner_party_id
  belongs_to :facility

  has_many :buyer_plants
  has_many :buyers, through: :buyer_plants

  validates :code, presence: true, uniqueness: true

  def plant_name
    "#{code} - #{facility&.name}"
  end
end
