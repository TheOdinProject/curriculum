class RenameProjectsToProjectSubmissions < ActiveRecord::Migration[6.0]
  def change
    rename_table :projects, :project_submissions
    rename_column :reports, :project_id, :project_submission_id
  end
end
