class AddSlugToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :slug, :string
    add_index :courses, :slug
  end
end
