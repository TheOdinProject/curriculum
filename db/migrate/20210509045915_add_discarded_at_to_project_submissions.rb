class AddDiscardedAtToProjectSubmissions < ActiveRecord::Migration[6.1]
  def change
    add_column :project_submissions, :discarded_at, :datetime
    add_index :project_submissions, :discarded_at
  end
end
