class Team < ApplicationRecord
    belongs_to :league
    has_many :user_teams, dependent: :destroy
    has_many :users, through: :user_teams
    has_many :team_seasons, dependent: :destroy
    has_many :trades, through: :team_seasons
    has_many :players
    has_many :draft_picks
    has_many :salaries, through: :players

    accepts_nested_attributes_for :players
    accepts_nested_attributes_for :user_teams
    accepts_nested_attributes_for :team_seasons
    accepts_nested_attributes_for :draft_picks

end
