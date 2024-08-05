class Season < ApplicationRecord
  belongs_to :league
  has_many :team_seasons
end
