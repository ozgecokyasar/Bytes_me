class RemoveAttemptedDrillsFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_reference :users, :attempted_drills, index: true, foreign_key: true
  end
end
