class RemoveMostColumnsFromTeamSeason < ActiveRecord::Migration[7.0]
  def change
    remove_column :team_seasons, :soft_cap
    remove_column :team_seasons, :hard_cap
    remove_column :team_seasons, :roster_size
    remove_column :team_seasons, :max_RFA_bid
    remove_column :team_seasons, :max_UFA_bid
    remove_column :team_seasons, :dead_cap
    remove_column :team_seasons, :year
  end
end
