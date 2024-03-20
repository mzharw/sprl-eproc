class Wbsproject < ApplicationRecord
  include ModelTrackable
  track_user(true)

  validates :desc, presence: true
  validates :wbs_id, presence: true, uniqueness: true
  validates :ctrl_name, presence: true
  validates :position, presence: true
  validates :payroll_id, presence: true
end
