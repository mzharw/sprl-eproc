class CostCenter < ApplicationRecord
  include ModelTrackable
  track_user(true)

  belongs_to :purch_group, optional: true
  validates :cost_center_id, presence: true, uniqueness: true
  validates :desc, presence: true
  validates :payroll_id, presence: true
  validates :ctrl_name, presence: true
end
