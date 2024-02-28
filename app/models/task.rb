class Task < ApplicationRecord
  belongs_to :taskable, polymorphic: true

  scope :ongoing, -> { where(state: 'ONGOING') }
end
