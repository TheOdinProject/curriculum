class RemoveProviderAndUidFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :provider
    remove_column :users, :uid
  end
end
