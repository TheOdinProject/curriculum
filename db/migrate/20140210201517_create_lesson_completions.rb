class CreateLessonCompletions < ActiveRecord::Migration
  def change
    create_table :lesson_completions do |t|
      t.integer :lesson_id
      t.integer :student_id
      t.timestamps
    end
    
    add_index :lesson_completions, [:lesson_id, :student_id], :unique => true
  end
end
