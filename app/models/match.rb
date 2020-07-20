class Match < ApplicationRecord
    belongs_to :season
    has_one :home_participant
    has_one :visitor_participant
end
