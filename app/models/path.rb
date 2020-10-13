class Path < ApplicationRecord
  extend FriendlyId

  has_many :users
  has_many :path_courses, -> { order(:position) }, dependent: :destroy
  has_many :courses, through: :path_courses

  validates :title, presence: true
  validates :description, presence: true
  validates :position, presence: true

  friendly_id :title, use: %i[slugged finders]

  scope :default, -> { find_by(default: true) }
end
