class CreateTeamSeasons < ActiveRecord::Migration[7.0]
  def change
    create_table :team_seasons do |t|
      t.integer :soft_cap
      t.integer :hard_cap
      t.integer :roster_size
      t.integer :incoming_pics
      t.integer :max_RFA_bid
      t.integer :max_UFA_bid
      t.integer :dead_cap
      #t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
