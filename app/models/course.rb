class Course < ApplicationRecord
  extend FriendlyId

  has_many :sections, -> { order(:position) }
  has_many :lessons, through: :sections
  has_many :track_courses

  scope :track_order, -> {
    Course.includes(:track_courses).order("track_courses.position") 
  }

  validates :position, presence: true

  friendly_id :title, use: [:slugged, :finders]

  def progress_for(user)
    user.progress_for(self)
  end
end
