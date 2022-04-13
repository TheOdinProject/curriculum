class RenameAdminFlashesToAnnouncements < ActiveRecord::Migration[6.1]
  def change
    rename_table :admin_flashes, :announcements
  end
end
