class CreateSplashEmails < ActiveRecord::Migration
  def change
    create_table :splash_emails do |t|
      t.string :email

      t.timestamps
    end
  end
end
