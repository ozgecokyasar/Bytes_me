class AddDrillToAnswer < ActiveRecord::Migration[5.1]
  def change
    add_reference :answers, :drill, index: true, foreign_key: true
  end
end
