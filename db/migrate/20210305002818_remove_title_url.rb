class RemoveTitleUrl < ActiveRecord::Migration[6.1]
  def change
    remove_column :lessons, :title_url
    remove_column :courses, :title_url
    remove_column :sections, :title_url
  end
end
