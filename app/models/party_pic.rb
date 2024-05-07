class PartyPic < ApplicationRecord
  belongs_to :party
  belongs_to :pic, class_name: 'Party', foreign_key: :pic_id, optional: true

  has_many :vendor_registration_entries, as: :entryable
end
