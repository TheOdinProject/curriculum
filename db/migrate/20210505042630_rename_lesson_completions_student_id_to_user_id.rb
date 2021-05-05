class RenameLessonCompletionsStudentIdToUserId < ActiveRecord::Migration[6.1]
  def change
    rename_column :lesson_completions, :student_id, :user_id
  end
end
