class CreateSeasons < ActiveRecord::Migration[7.0]
  def change
    create_table :seasons do |t|
      t.references :league, null: false, foreign_key: true
      t.integer :start_year
      t.integer :end_year

      t.timestamps
    end
  end
end
