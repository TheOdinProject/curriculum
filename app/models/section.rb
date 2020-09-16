class Section < ApplicationRecord
  belongs_to :course
  has_many :lessons, -> { order(:position) }

  validates :position, presence: true
end
