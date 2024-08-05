class Salary < ApplicationRecord
    belongs_to :player
    belongs_to :team_season
end
