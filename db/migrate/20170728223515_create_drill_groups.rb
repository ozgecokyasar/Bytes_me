class CreateDrillGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :drill_groups do |t|
      t.string :drill_group_name
      t.string :difficulty

      t.timestamps
    end
  end
end
