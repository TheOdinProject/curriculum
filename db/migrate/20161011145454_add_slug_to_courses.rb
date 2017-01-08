class AddSlugToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :slug, :string
    add_index :courses, :slug
  end
end
