class ChangeTeamSeasonReferenceToSeasonOnTrades < ActiveRecord::Migration[7.0]
  def change
    remove_reference :trades, :team_season, foreign_key: true
    add_reference :trades, :season, foreign_key: true
  end
end
