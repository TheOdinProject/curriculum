class AddCachedVotesToProjectSubmissions < ActiveRecord::Migration[6.0]
  def change
    add_column :project_submissions, :cached_votes_total, :integer, default: 0
  end
end
