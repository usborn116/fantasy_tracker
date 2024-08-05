class RemoveNullAssociationFromTeamsToUser < ActiveRecord::Migration[7.0]
  def change
    change_column_null :teams, :user_id, true
  end
end
