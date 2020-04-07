class AddStudentIndexToLessonCompletions < ActiveRecord::Migration[5.0][5.0]
  def change
    add_index :lesson_completions, :student_id
  end
end
