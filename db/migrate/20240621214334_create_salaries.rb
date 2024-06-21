class CreateSalaries < ActiveRecord::Migration[7.0]
  def change
    create_table :salaries do |t|
      t.string :season
      t.integer :value
      t.boolean :free_agent
      t.boolean :waiver_acquisition
      #t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
