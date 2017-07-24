class Section < ApplicationRecord
  belongs_to :course
  has_many :lessons, -> { order(:position) }

  validates_uniqueness_of :position, message: 'Section position has already been taken'
end
