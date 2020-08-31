class Track < ApplicationRecord
  extend FriendlyId

  has_many :users
  has_many :track_courses, -> { order(:position) }, dependent: :delete_all
  has_many :courses, through: :track_courses

  validates :title, presence: true
  validates :description, presence: true
  validates :position, presence: true

  friendly_id :title, use: %i[slugged finders]

  scope :default, -> { find_by(default: true) }
end
