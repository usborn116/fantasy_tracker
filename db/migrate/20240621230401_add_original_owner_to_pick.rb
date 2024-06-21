class AddOriginalOwnerToPick < ActiveRecord::Migration[7.0]
  def change
    add_reference :draft_picks, :original_owner
  end
end
