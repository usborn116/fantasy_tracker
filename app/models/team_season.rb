class TeamSeason < ApplicationRecord
    belongs_to :team
    belongs_to :season
    has_many :trades
    has_many :salaries
    has_many :draft_picks
end
