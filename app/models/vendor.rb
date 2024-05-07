class Vendor < ApplicationRecord
  include ModelTrackable

  track_user
  track_number(
    :code, pad_value: 7, pad_char: '0',
    prefix: :vendor_type_id,
    prefix_options: { '900918ba-40bf-4b5b-ae5f-64eb3aee16aa' => '1', 'a04637e7-b9ca-43e5-9c76-858c12e99652' => '2' }
  )

  belongs_to :party, optional: true
  belongs_to :vendor_type

  has_one :legal_org, through: :party
  has_one :party_facility, through: :party
  has_one :vendor_registration

  has_many :vendor_registration_entries, as: :entryable

  validates :code, presence: true, uniqueness: true
end
