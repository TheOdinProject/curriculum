class AddContentToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :content, :text
  end
end
