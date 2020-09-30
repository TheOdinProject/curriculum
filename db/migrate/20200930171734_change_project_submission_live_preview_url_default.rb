class ChangeProjectSubmissionLivePreviewUrlDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :project_submissions, :live_preview_url, :string, default: '', null: false
  end
end
