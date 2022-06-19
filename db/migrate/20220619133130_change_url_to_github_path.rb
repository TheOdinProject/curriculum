class ChangeUrlToGithubPath < ActiveRecord::Migration[6.1]
  def change
    rename_column :lessons, :url, :github_path
  end
end
