class ChangeIscorrectNameAnswersModel < ActiveRecord::Migration[5.1]
  def change
    rename_column :answers, :is_correct?, :is_correct
  end
end
