class AddRepoToLesson < ActiveRecord::Migration[5.0][5.0]
  def change
    add_column :lessons, :repo, :string
  end
end
