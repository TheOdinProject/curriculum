class AddUrlAndMessageToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :url, :string, null: false
    add_column :notifications, :message, :text, null: false
  end
end
