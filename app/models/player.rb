class Player < ApplicationRecord
    belongs_to :team
    has_many :salaries, dependent: :destroy

    accepts_nested_attributes_for :salaries
end
