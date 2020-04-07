class LessonCompletion < ApplicationRecord
  validates_presence_of [:student_id, :lesson_id]

  belongs_to :student, class_name: 'User'
  belongs_to :lesson
end
