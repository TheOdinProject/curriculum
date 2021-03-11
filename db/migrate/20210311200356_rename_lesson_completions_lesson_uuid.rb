class RenameLessonCompletionsLessonUuid < ActiveRecord::Migration[6.1]
  def change
    rename_column :lesson_completions, :lesson_idenfier_uuid, :lesson_identifier_uuid
  end
end
