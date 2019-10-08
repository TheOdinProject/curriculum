class RemoveIndexFromLessonNames < ActiveRecord::Migration[5.0]
  def up
    remove_index :lessons, :column => :title
  end

  def down
    add_index :lessons, :title, :unique => true
  end
end
