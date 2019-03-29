class RemoveRegBeforeConfFromUsersTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :reg_before_conf
  end
end
