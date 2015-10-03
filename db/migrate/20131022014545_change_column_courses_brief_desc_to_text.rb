class ChangeColumnCoursesBriefDescToText < ActiveRecord::Migration
  def up
    change_column :courses, :brief_desc, :text
  end

  def down
    change_column :courses, :brief_desc, :string
  end
end
