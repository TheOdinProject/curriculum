class RemovePositionIndexes < ActiveRecord::Migration[5.0][5.0]
  def change
    remove_index :lessons, :position
    add_index :lessons, :position
  end
end
