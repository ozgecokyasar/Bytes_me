class ChangeTypeIsCorrect < ActiveRecord::Migration[5.1]
  def change
    change_column :attempted_drills, :is_correct, 'boolean USING CAST(is_correct AS boolean)'
  end
end
