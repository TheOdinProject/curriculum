class AddTitleUrlToCoursesAndLessonsAndSections < ActiveRecord::Migration
  def change
    add_column :courses, :title_url, :string
    add_column :sections, :title_url, :string
    add_column :lessons, :title_url, :string
    add_index :courses, :title_url
    add_index :sections, :title_url
    add_index :lessons, :title_url
  end
end
