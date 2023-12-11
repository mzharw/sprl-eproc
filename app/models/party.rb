class Party < ApplicationRecord
    include ModelTrackable
    track_user
end
