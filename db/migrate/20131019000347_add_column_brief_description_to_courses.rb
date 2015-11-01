class AddColumnBriefDescriptionToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :brief_desc, :string
  end
end
