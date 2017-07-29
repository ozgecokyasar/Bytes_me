class AddDrillToAnswer < ActiveRecord::Migration[5.1]
  def change
    add_reference :answers, :drill, foreign_key: true, index:true
  end
end
