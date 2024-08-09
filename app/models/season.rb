class Season < ApplicationRecord
  belongs_to :league
  has_many :team_seasons
  has_many :draft_picks

  accepts_nested_attributes_for :team_seasons
end
