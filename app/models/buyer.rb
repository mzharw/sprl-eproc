class Buyer < ApplicationRecord
  belongs_to :party, optional: true

  has_many :buyer_purch_groups
  has_many :purch_groups, through: :buyer_purch_groups

  has_many :buyer_plants
  has_many :plants, through: :buyer_plants

  accepts_nested_attributes_for :party

end
