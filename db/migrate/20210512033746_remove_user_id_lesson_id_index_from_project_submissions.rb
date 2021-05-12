class RemoveUserIdLessonIdIndexFromProjectSubmissions < ActiveRecord::Migration[6.1]
  def change
    remove_index :project_submissions, column: %i[user_id lesson_id]
  end
end
