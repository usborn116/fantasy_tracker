class Player < ApplicationRecord
    belongs_to :team, optional: true
    belongs_to :league
    has_many :salaries, dependent: :destroy
    validate :player_exists_in_nba, :on => :create

    accepts_nested_attributes_for :salaries

    private

    def player_exists_in_nba
      if !NbaPool::Player.exists?(nba_id: self.nba_id)
        errors.add(:player, "has to be in the NBA")
      end
    end
end
