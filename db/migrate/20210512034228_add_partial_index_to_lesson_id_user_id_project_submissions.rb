class AddPartialIndexToLessonIdUserIdProjectSubmissions < ActiveRecord::Migration[6.1]
  def change
    add_index :project_submissions, %i[user_id lesson_id], unique: true, where: 'discarded_at is null'
  end
end
