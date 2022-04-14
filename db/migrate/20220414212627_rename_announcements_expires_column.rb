class RenameAnnouncementsExpiresColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :announcements, :expires, :expires_at
    change_column_null :announcements, :expires_at, false
  end
end
