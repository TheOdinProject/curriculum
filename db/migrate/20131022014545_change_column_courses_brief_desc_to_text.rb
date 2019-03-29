class ChangeColumnCoursesBriefDescToText < ActiveRecord::Migration[5.0]
  def up
    change_column :courses, :brief_desc, :text
  end

  def down
    change_column :courses, :brief_desc, :string
  end
end
