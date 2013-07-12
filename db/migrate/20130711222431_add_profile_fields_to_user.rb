class AddProfileFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :about, :text
    add_column :users, :github, :string
    add_column :users, :twitter, :string
    add_column :users, :facebook, :string
    add_column :users, :linkedin, :string
    add_column :users, :google_plus, :string
    add_column :users, :skype, :string
    add_column :users, :screenhero, :string
  end
end
