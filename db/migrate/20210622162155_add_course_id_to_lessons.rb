class AddCourseIdToLessons < ActiveRecord::Migration[6.1]
  def change
    add_reference :lessons, :course, index: true
    add_foreign_key :lessons, :courses

    remove_index :lessons, %i[identifier_uuid section_id], unique: true
    add_index :lessons, %i[identifier_uuid course_id], unique: true

    sql = %(
      Update lessons
      set course_id = sections.course_id
      from sections
      where lessons.section_id = sections.id
    )

    ActiveRecord::Base.connection.execute(sql)
  end
end
