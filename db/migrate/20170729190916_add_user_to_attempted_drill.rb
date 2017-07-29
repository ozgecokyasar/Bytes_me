class AddUserToAttemptedDrill < ActiveRecord::Migration[5.1]
  def change
    add_reference :attempted_drills, :user, index: true, foreign_key: true
  end
end
