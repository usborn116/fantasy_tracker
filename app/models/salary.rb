class Salary < ApplicationRecord
    belongs_to :player
    belongs_to :season
end
