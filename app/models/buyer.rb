class Buyer < ApplicationRecord
  belongs_to :party, optional: true

  has_many :buyer_purch_groups
  has_many :purch_groups, through: :buyer_purch_groups

  has_many :buyer_plants
  has_many :plants, through: :buyer_plants

  # validates :code, presence: true, uniqueness: true
  validates :party_id, presence: true, on: :create

  accepts_nested_attributes_for :party

end
