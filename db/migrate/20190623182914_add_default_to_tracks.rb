class AddDefaultToTracks < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :default, :boolean, default: false
  end

  def down
    remove_column :tracks, :default
  end
end
