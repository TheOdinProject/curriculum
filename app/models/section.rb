class Section < ApplicationRecord
  belongs_to :course
  has_many :lessons, -> { order(:position) }, inverse_of: :section

  validates :position, presence: true
end
