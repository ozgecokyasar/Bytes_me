class AddDrillGroupToDrill < ActiveRecord::Migration[5.1]
  def change
    add_reference :drills, :drill_group, foreign_key: true, index:true
  end
end
