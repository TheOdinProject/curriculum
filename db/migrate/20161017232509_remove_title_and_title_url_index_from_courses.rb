class RemoveTitleAndTitleUrlIndexFromCourses < ActiveRecord::Migration[5.0]
  def change
    remove_index :courses, :title
    remove_index :courses, :title_url
  end
end
