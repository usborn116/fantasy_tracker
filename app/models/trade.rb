class Trade < ApplicationRecord
  belongs_to :team1, class_name: "Team", foreign_key: :team1_id
  belongs_to :team2, class_name: "Team", foreign_key: :team1_id
  belongs_to :team_season, optional: true
  belongs_to :league

  after_create :set_status

  def set_status
    self.update(status: "pending")
  end
end
