class AddSlugToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :slug, :string
    add_index :lessons, :slug
  end
end
