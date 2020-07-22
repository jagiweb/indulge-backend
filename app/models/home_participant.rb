class HomeParticipant < ApplicationRecord
    has_one :match
    has_one :team
end
