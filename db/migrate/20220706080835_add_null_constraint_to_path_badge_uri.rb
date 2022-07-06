class AddNullConstraintToPathBadgeUri < ActiveRecord::Migration[6.1]
  def change
    change_column_null :paths, :badge_uri, false
  end
end
