class Course < ApplicationRecord
  extend FriendlyId

  has_many :track_courses
  has_many :tracks, through: :track_courses
  has_many :sections, -> { order(:position) }
  has_many :lessons, through: :sections

  validates :position, presence: true

  friendly_id :title, use: [:slugged, :finders]

  def progress_for(user)
    user.progress_for(self)
  end
end
