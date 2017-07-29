class AddUserToAttemotedDrills < ActiveRecord::Migration[5.1]
  def change
    add_reference :attempted_drills, :user, foreign_key: true, index: true
  end
end
