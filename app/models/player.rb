class Player < ApplicationRecord
    belongs_to :team
    has_many :salaries

    accepts_nested_attributes_for :team
    accepts_nested_attributes_for :salaries
end
