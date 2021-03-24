class Course < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: %i[slugged history finders]

  has_many :path_courses
  has_many :paths, through: :path_courses
  has_many :sections, -> { order(:position) }
  has_many :lessons, through: :sections

  validates :position, presence: true

  def progress_for(user)
    user.progress_for(self)
  end
end
