class AddColumnBriefDescriptionToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :brief_desc, :string
  end
end
