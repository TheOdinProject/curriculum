class AddBadgeUriToPaths < ActiveRecord::Migration[6.1]
  def change
    add_column :paths, :badge_uri, :string
  end
end
