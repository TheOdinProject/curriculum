class AddIndexToSplashEmails < ActiveRecord::Migration
  def change
    add_index :splash_emails, :email, unique: true
  end
end
