class Party < ApplicationRecord
    include ModelTrackable
    track_user(true)

    has_one :personnel
end
