class Season < ApplicationRecord
  belongs_to :league
  has_many :team_seasons, dependent: :destroy
  has_many :draft_picks
  has_many :trades
  has_many :salaries

  accepts_nested_attributes_for :team_seasons
end
