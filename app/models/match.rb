class Match < ApplicationRecord
    belongs_to :season
    belongs_to :home_participant
    belongs_to :visitor_participant
   
end
