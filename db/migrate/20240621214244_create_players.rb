class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.integer :nba_id
      t.string :slug
      t.integer :draft_year
      t.boolean :trade_block
      #t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
