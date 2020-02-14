class CreateJoinTableTracksCourses < ActiveRecord::Migration[5.0]
  def up
    create_table :track_courses do |t|
      t.integer :track_id
      t.integer :course_id
      t.integer :position

      t.timestamps
    end
  end

  def down
    drop_table :track_courses
  end
end
