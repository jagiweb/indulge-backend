class Season < ApplicationRecord
  belongs_to :tournament
  has_many :matches
  has_many :teams
end
