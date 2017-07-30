class ChangeAttemptedAnswerColumnIscorrect < ActiveRecord::Migration[5.1]
  def change
    rename_column :attempted_drills, :is_correct?, :is_correct
  end
end
