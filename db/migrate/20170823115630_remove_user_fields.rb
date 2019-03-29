class RemoveUserFields < ActiveRecord::Migration[5.0][5.0]
  def change
    remove_column :users, :github
    remove_column :users, :twitter
    remove_column :users, :facebook
    remove_column :users, :linkedin
    remove_column :users, :google_plus
    remove_column :users, :skype
    remove_column :users, :screenhero
    remove_column :users, :legal_agreement
    remove_column :users, :legal_agree_date
  end
end
