class AddAdminFieldToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin, :boolean, null: false, default: false
  end
end
