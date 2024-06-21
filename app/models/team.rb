class Team < ApplicationRecord
    belongs_to :league
    belongs_to :user
    has_many :team_seasons
    has_many :players
    has_many :draft_picks
end
