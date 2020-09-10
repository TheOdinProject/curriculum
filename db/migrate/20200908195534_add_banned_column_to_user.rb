class AddBannedColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :banned, :boolean, default: false, null: false
  end
end
