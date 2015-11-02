class CreateUserPrefs < ActiveRecord::Migration
  def change
    create_table :user_prefs do |t|
      t.integer :user_id

      t.timestamps
    end

    add_index :user_prefs, :user_id, :unique => true
  end
end
