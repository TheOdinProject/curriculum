class LessonCompletion < ApplicationRecord
  belongs_to :student, class_name: 'User'
  belongs_to :lesson

  validates_presence_of %i[student_id lesson_id]

  scope :created_today, -> { where('created_at >= ?', Time.zone.now.beginning_of_day) }
end
