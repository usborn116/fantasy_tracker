class AddBaseCapToSeason < ActiveRecord::Migration[7.0]
  def change
    add_column :seasons, :base_cap, :integer
  end
end
