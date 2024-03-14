class PurchGroup < ApplicationRecord
  include ModelTrackable
  track_user(true)

  belongs_to :party, optional: true

  has_many :buyer_purch_groups
  has_many :buyers, through: :buyer_purch_groups

  def purch_group_name
    "#{code} - #{party&.full_name}"
  end

  accepts_nested_attributes_for :party
end
