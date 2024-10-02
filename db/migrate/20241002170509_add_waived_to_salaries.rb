class AddWaivedToSalaries < ActiveRecord::Migration[7.0]
  def change
    add_column :salaries, :waived, :boolean
  end
end
