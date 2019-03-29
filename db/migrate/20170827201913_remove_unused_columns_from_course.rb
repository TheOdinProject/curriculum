class RemoveUnusedColumnsFromCourse < ActiveRecord::Migration[5.0][5.0]
  def change
    remove_column :courses, :you_learn
    remove_column :courses, :you_build
    remove_column :courses, :teaser
    remove_column :courses, :brief_desc
    remove_column :courses, :is_active
  end
end
