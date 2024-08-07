class CreateNbaPoolPlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :nba_pool_players do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.integer :nba_id
      t.string :slug
      t.integer :draft_year
      t.string :nba_team

      t.timestamps
    end
  end
end
