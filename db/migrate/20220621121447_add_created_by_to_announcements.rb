class AddCreatedByToAnnouncements < ActiveRecord::Migration[6.1]
  def change
    add_reference :announcements, :user, foreign_key: true
  end
end
