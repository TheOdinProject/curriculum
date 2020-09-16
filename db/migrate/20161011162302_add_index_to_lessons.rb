class AddIndexToLessons < ActiveRecord::Migration[5.0]
  def change
    remove_index :lessons, :title_url
    remove_index :lessons, :section_id
    remove_index :lessons, :slug
    add_index :lessons, %i[slug section_id], unique: true
  end
end
