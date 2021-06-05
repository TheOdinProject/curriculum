class LessonCompletion < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :user_id, :lesson_id, presence: true

  scope :created_today, -> { where('created_at >= ?', Time.zone.now.beginning_of_day) }
end
