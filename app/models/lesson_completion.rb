class LessonCompletion < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates_presence_of %i[user_id lesson_id]

  scope :created_today, -> { where('created_at >= ?', Time.zone.now.beginning_of_day) }
end
