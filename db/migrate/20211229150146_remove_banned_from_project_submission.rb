class RemoveBannedFromProjectSubmission < ActiveRecord::Migration[6.1]
  def change
    remove_column :project_submissions, :banned
  end
end
