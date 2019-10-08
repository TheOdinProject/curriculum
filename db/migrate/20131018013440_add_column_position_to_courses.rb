class AddColumnPositionToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :position, :integer, :null => false
  end
end
