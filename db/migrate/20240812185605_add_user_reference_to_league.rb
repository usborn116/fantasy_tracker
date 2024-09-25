class AddUserReferenceToLeague < ActiveRecord::Migration[7.0]
  def change
    add_reference :leagues, :user, foreign_key: true
    rename_column :user_leagues, :user_id, :member_id
    rename_table :user_leagues, :league_memberships
  end
end
