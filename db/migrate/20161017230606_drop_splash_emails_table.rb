class DropSplashEmailsTable < ActiveRecord::Migration
  def change
    drop_table :splash_emails
  end
end
