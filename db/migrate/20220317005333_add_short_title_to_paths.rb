class AddShortTitleToPaths < ActiveRecord::Migration[6.1]
  def change
    add_column :paths, :short_title, :string
  end
end
