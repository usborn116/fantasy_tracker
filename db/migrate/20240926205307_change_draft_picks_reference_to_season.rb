class ChangeDraftPicksReferenceToSeason < ActiveRecord::Migration[7.0]
  def change
    remove_reference :draft_picks, :team_season, foreign_key: true
    add_reference :draft_picks, :season, foreign_key: true
  end
end
