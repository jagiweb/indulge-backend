class Tournament < ApplicationRecord
  has_many :seasons
  belongs_to :user
  # enum type: [:International, :National, :Regional]
end
