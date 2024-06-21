class AddTeamOwnerReferenceToDraftPicks < ActiveRecord::Migration[7.0]
  def change
      add_foreign_key :draft_picks, :teams, column: :original_owner_id, primary_key: :id
  end
end
