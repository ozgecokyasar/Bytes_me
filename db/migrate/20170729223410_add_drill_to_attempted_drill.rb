class AddDrillToAttemptedDrill < ActiveRecord::Migration[5.1]
  def change
    add_reference :attempted_drills, :drill, index: true, foreign_key: true
  end
end
