class AddBannedColumnToProjectSubmissions < ActiveRecord::Migration[6.0]
  def change
    add_column :project_submissions, :banned, :boolean, default: false, null: false
  end
end
