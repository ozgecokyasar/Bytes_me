class AddDrillGroupToDrill < ActiveRecord::Migration[5.1]
  def change
    add_reference :drills, :drill_group, index: true, foreign_key: true
  end
end
