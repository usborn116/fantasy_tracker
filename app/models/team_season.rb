class TeamSeason < ApplicationRecord
    belongs_to :team
    has_many :trades
    has_many :salaries
    has_many :draft_picks
end
