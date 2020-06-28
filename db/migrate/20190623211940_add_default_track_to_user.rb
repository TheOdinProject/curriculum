class AddDefaultTrackToUser < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :track_id, :integer, default: track_id
  end

  def down
    remove_column :users, :track_id
  end

  private

  def track_id
    default_track = Track.find_by(title: 'Full Stack Ruby on Rails')

    if default_track.present?
      default_track.id
    else
      1
    end
  end
end
