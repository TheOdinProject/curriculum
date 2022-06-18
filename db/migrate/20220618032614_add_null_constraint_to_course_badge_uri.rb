class AddNullConstraintToCourseBadgeUri < ActiveRecord::Migration[6.1]
  def change
    change_column_null :courses, :badge_uri, false
  end
end
