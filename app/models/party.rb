class Party < ApplicationRecord
    include ModelTrackable
    track_user(true)

    has_one :personnel
    has_one :purch_group
    has_one :buyer
    has_one :party_facility
    has_one :legal_org
end
