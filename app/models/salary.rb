class Salary < ApplicationRecord
    belongs_to :player
    belongs_to :season, optional: true
end
