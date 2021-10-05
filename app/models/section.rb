class Section < ApplicationRecord
  belongs_to :course
  has_many :lessons, -> { order(:position) }, inverse_of: :section, dependent: :destroy

  validates :position, presence: true
end
