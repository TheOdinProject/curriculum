class AddIndexToSplashEmails < ActiveRecord::Migration[5.0]
  def change
    add_index :splash_emails, :email, unique: true
  end
end
