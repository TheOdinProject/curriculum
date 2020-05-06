class LessonCompletion < ApplicationRecord
  validates_presence_of [:student_id, :lesson_id]

  belongs_to :student, class_name: 'User'
  belongs_to :lesson

  scope :created_today, -> { where('created_at >= ?', Time.zone.now.beginning_of_day)}
end
