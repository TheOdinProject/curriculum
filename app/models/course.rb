class Course < ApplicationRecord
  extend FriendlyId

  has_many :sections, -> { order(:position) }
  has_many :lessons, through: :sections

  validates_uniqueness_of :position

  friendly_id :title, use: [:slugged, :finders]

  def percent_completed_by(user)
    100 * (1.0 - uncompleted_lessons_count(user) / lessons_count.to_f)
  end

  def completed_by?(user)
    percent_completed_by(user) == 100
  end

  def lessons_count
    lessons.count
  end

  private

  def uncompleted_lessons_count(user)
    (lessons - user.completed_lessons).count
  end
end
