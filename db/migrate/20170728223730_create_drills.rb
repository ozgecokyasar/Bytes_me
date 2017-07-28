class CreateDrills < ActiveRecord::Migration[5.1]
  def change
    create_table :drills do |t|
      t.string :title
      t.integer :points
      t.timestamps
    end
  end
end
