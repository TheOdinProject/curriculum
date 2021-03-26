class AddLessonForeignKeyToLessonCompletions < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :lesson_completions, :lessons, on_delete: :cascade
  end
end
