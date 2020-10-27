class Path < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: %i[slugged finders]

  has_many :users
  has_many :path_courses, -> { order(:position) }, dependent: :destroy
  has_many :courses, through: :path_courses

  validates :title, presence: true
  validates :description, presence: true
  validates :position, presence: true

  def self.default_path
    find_by(default_path: true)
  end
end
