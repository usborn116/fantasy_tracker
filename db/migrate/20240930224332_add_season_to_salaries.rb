class AddSeasonToSalaries < ActiveRecord::Migration[7.0]
  def change
    remove_reference :salaries, :team_season, foreign_key: true
    add_reference :salaries, :season, foreign_key: true
  end
end
