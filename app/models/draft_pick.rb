class DraftPick < ApplicationRecord
    belongs_to :team
    belongs_to :original_owner, class_name: "Team", foreign_key: :original_owner_id
end
