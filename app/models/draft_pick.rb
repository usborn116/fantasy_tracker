class DraftPick < ApplicationRecord
    belongs_to :team
    belongs_to :original_owner, class_name: "Team", foreign_key: :original_owner_id
    belongs_to :season

    before_validation :set_team_to_original_owner

    private

    def set_team_to_original_owner
      self.team_id = self.original_owner_id
    end
end
