class RemoveUniqueUserIndex < ActiveRecord::Migration[5.0][5.0]
  def change
    # remove username index and add it again to change uniqueness
    remove_index :users, :username
    add_index :users, :username
  end
end
