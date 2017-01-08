class RemoveIndexFromSectionNames < ActiveRecord::Migration
  def up
    remove_index :sections, :column => :title
  end

  def down
    add_index :sections, :title, :unique => true
  end
end
