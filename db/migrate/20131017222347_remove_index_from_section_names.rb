class RemoveIndexFromSectionNames < ActiveRecord::Migration[5.0]
  def up
    remove_index :sections, :column => :title
  end

  def down
    add_index :sections, :title, :unique => true
  end
end
