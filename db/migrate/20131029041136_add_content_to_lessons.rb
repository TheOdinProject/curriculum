class AddContentToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :content, :text
  end
end
