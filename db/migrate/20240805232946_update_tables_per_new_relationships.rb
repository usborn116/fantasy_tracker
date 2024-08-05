class UpdateTablesPerNewRelationships < ActiveRecord::Migration[7.0]
  def change
    add_reference :draft_picks, :team_season, null: true, foreign_key: true
    add_reference :salaries, :team_season, foreign_key: true
    add_reference :trades, :league, foreign_key: true
    add_column :team_seasons, :year, :integer
    add_column :trades, :status, :string
    rename_column :team_seasons, :incoming_pics, :incoming_picks
  end
end
