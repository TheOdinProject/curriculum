class DropSplashEmailsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :splash_emails
  end
end
