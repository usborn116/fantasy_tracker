class AddSeasonReferenceToTeamSeason < ActiveRecord::Migration[7.0]
  def change
    add_reference :team_seasons, :season, foreign_key: true
  end
end
