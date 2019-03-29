class CreateSplashEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :splash_emails do |t|
      t.string :email

      t.timestamps
    end
  end
end
