class Section < ActiveRecord::Base
  belongs_to :course
  has_many :lessons

  validates_uniqueness_of :position, :message => "Section position has already been taken"

end
