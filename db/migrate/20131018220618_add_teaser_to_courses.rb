class AddTeaserToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :teaser, :string
  end
end
