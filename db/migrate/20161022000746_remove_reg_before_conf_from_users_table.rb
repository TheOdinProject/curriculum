class RemoveRegBeforeConfFromUsersTable < ActiveRecord::Migration
  def change
    remove_column :users, :reg_before_conf
  end
end
