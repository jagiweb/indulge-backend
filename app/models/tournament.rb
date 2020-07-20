class Tournament < ApplicationRecord
  has_many :seasons
  belongs_to :user
end
