class AddReferencesToTables < ActiveRecord::Migration[7.0]
  def change
    add_reference :players, :team, foreign_key: true
    add_reference :salaries, :player, null: false, foreign_key: true
    add_reference :draft_picks, :team, null: false, foreign_key: true
    add_reference :teams, :user, null: false, foreign_key: true
    add_reference :teams, :league, null: false, foreign_key: true
    add_reference :team_seasons, :team, null: false, foreign_key: true
    add_reference :trades, :team_season, null: false, foreign_key: true
    
  end
end
