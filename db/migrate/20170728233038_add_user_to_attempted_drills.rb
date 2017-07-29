class AddUserToAttemptedDrills < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :attempted_drills, foreign_key: true, index:true
  end
end
