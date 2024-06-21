class CreateDraftPicks < ActiveRecord::Migration[7.0]
  def change
    create_table :draft_picks do |t|
      t.integer :year
      t.integer :round
      t.integer :pick
      #t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
