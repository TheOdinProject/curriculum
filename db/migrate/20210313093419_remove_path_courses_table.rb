class RemovePathCoursesTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :path_courses

    add_column :courses, :path_id, :integer
    add_index :courses, :path_id
  end
end
