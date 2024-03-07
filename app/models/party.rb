class Party < ApplicationRecord
    include ModelTrackable
    track_user(true)

    has_one :personnel
    has_one :purch_group
    has_one :buyer
end
