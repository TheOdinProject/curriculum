class AddConfirmableForReal < ActiveRecord::Migration
  # Note: You can't use change, as User.update_all with fail in the down migration
  def self.up
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :users, :confirmation_token, :unique => true
    # User.reset_column_information # Need for some types of updates, but not for update_all.
    # Add column to mark users who registered before confirmation was required
    add_column :users, :reg_before_conf, :boolean, default: false
    # Mark existing users as registered before confirmation
    User.update_all(:reg_before_conf => true)
    # All existing user accounts should be able to log in after this.
  end

  def self.down
    remove_columns :users, :confirmation_token, :confirmed_at, :confirmation_sent_at, :reg_before_conf
    remove_columns :users, :unconfirmed_email # Only if using reconfirmable
  end
end