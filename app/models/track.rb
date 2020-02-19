class Track < ApplicationRecord
  has_many :users
  has_many :track_courses, dependent: :delete_all
  has_many :courses, through: :track_courses

  validates :title, presence: true
  validates :description, presence: true
  validates :position, presence: true

  scope :default, -> { find_by(default: true) }
end
