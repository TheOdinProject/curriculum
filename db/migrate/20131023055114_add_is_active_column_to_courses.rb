class AddIsActiveColumnToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :is_active, :boolean, :default => false
  end
end
