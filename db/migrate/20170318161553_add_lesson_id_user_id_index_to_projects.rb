class AddLessonIdUserIdIndexToProjects < ActiveRecord::Migration[5.0][5.0]
  def change
    add_index :projects, [:user_id, :lesson_id], unique: true
  end
end
