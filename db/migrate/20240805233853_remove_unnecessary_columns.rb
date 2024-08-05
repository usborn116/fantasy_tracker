class RemoveUnnecessaryColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :league_id
    remove_column :team_seasons, :incoming_picks
    remove_column :salaries, :season
    add_column :players, :nba_team, :string
  end
end
