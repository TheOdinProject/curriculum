class RenameTracksToPaths < ActiveRecord::Migration[6.0]
  def change
    rename_table :tracks, :paths

    rename_column :users, :track_id, :path_id
    rename_column :track_courses, :track_id, :path_id
    rename_table :track_courses, :path_courses
  end
end
