class AddIndexForLessonsUrl < ActiveRecord::Migration[6.0]
  def change
    add_index :lessons, :url
  end
end
