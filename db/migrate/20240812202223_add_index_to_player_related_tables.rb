class AddIndexToPlayerRelatedTables < ActiveRecord::Migration[7.0]
  def change
    add_index(:players, :nba_id)
    add_index(:nba_pool_players, :nba_id)
  end
end
