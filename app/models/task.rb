class Task < ApplicationRecord
  include ModelTrackable
  belongs_to :taskable, polymorphic: true
  belongs_to :user
  track_user(true)
  scope :ongoing, -> { where(state: 'ONGOING') }

end
