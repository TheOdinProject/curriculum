class AddShowOnHomepageFlagAndBadgeUriToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :show_on_homepage, :boolean, default: false, null: false
    add_column :courses, :badge_uri, :string
  end
end
