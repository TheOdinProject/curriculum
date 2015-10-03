class AddColumnPositionToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :position, :integer, :null => false
  end
end
