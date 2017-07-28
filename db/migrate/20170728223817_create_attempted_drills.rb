class CreateAttemptedDrills < ActiveRecord::Migration[5.1]
  def change
    create_table :attempted_drills do |t|
      t.string :is_correct?
      t.timestamps
    end
  end
end
