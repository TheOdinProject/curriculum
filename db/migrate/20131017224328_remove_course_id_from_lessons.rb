class RemoveCourseIdFromLessons < ActiveRecord::Migration
  def up
    remove_index :lessons, :column => :course_id
    remove_column :lessons, :course_id
  end

  def down
    add_column :lessons, :course_id, :integer, :null => false
    add_index :lessons, :course_id
  end
end
