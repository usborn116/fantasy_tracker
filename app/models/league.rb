class League < ApplicationRecord
    has_many :teams
    has_many :user_leagues
    has_many :users, through: :user_leagues
    has_many :trades
    has_many :seasons

end
