class Team < ApplicationRecord
    belongs_to :league
    has_many :user_teams, dependent: :destroy
    has_many :users, through: :user_teams
    has_many :team_seasons, dependent: :destroy
    has_many :trade_proposals, :inverse_of => :team1, class_name: "Trade", foreign_key: :team1_id
    has_many :received_trade_proposals, :inverse_of => :team2, class_name: "Trade", foreign_key: :team2_id
    has_many :players
    has_many :draft_picks
    has_many :original_draft_picks, :inverse_of => :original_owner, class_name: "DraftPick", foreign_key: :original_owner_id
    has_many :salaries, through: :players

    accepts_nested_attributes_for :players
    accepts_nested_attributes_for :user_teams
    accepts_nested_attributes_for :team_seasons
    accepts_nested_attributes_for :draft_picks

end
