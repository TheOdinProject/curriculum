class RemoveTitleAndTitleUrlIndexFromCourses < ActiveRecord::Migration
  def change
    remove_index :courses, :title
    remove_index :courses, :title_url
  end
end
