class CreateLeagues < ActiveRecord::Migration[7.0]
  def change
    create_table :leagues do |t|
      t.integer :league_id
      t.string :name
      t.integer :current_start_year
      t.integer :current_end_year
      #t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
