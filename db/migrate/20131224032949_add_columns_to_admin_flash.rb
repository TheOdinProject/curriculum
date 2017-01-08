class AddColumnsToAdminFlash < ActiveRecord::Migration
  def change
    add_column :admin_flashes, :message, :string
    add_column :admin_flashes, :expires, :datetime
  end
end
