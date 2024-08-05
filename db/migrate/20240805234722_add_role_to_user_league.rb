class AddRoleToUserLeague < ActiveRecord::Migration[7.0]
  def change
    add_column :user_leagues, :role, :string
    remove_column :users, :role
  end
end
