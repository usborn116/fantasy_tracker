class CreateTrades < ActiveRecord::Migration[7.0]
  def change
    create_table :trades do |t|
      t.references :team1
      t.references :team2
      t.string :outgoing
      t.string :incoming
      #t.references :team_season, null: false, foreign_key: true

      t.timestamps
    end

    add_foreign_key :trades, :teams, column: :team1_id, primary_key: :id
    add_foreign_key :trades, :teams, column: :team2_id, primary_key: :id
  end
end
