class AddIsActiveColumnToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :is_active, :boolean, :default => false
  end
end
