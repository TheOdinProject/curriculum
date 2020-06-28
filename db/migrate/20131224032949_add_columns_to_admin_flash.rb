class AddColumnsToAdminFlash < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_flashes, :message, :string
    add_column :admin_flashes, :expires, :datetime
  end
end
