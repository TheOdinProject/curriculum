class DenormalizeLessonCompletions < ActiveRecord::Migration[6.1]
  def up
    add_column :lesson_completions, :lesson_idenfier_uuid, :string, null: false, default: ''
    add_column :lesson_completions, :course_id, :integer
    add_column :lesson_completions, :path_id, :integer

    add_index :lesson_completions, :lesson_idenfier_uuid
    add_index :lesson_completions, :course_id
    add_index :lesson_completions, :path_id
  end

  def down
    remove_column :lesson_completions, :lesson_idenfier_uuid
    remove_column :lesson_completions, :course_id
    remove_column :lesson_completions, :path_id

    remove_index :lesson_completions, :lesson_idenfier_uuid
    remove_index :lesson_completions, :course_id
    remove_index :lesson_completions, :path_id
  end
end
