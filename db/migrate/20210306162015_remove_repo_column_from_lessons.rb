class RemoveRepoColumnFromLessons < ActiveRecord::Migration[6.1]
  def change
    remove_column :lessons, :repo
  end
end
