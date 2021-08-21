class AddDiscardAtToProjectSubmissions < ActiveRecord::Migration[6.1]
  def change
    add_column :project_submissions, :discard_at, :datetime
  end
end
