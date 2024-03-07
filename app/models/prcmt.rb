class Prcmt < ApplicationRecord
  include ModelTrackable

  track_user
  track_number(
    :number, pad_value: -6, pad_char: '0', prefix: 'BID-'
  )

  belongs_to :prcmt_type
  belongs_to :purch_group
  has_many :prcmt_items
  has_many :purch_reqn_items, through: :prcmt_items

  validates :name, presence: true
  validates :business_field, presence: true
  validates :prcmt_type_id, presence: true
  validates :purch_group_id, presence: true
  validates :prequalification, inclusion: { in: [true, false] }
  validates :bid_submission_method, presence: true
  validates :assessment_method, presence: true
  # validates :procurement_criterion, presence: true
  # validates :e_auction, presence: true
end
