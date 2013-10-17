class Section < ActiveRecord::Base
  attr_accessible :course_id, :position, :title

  belongs_to :course
  has_many :lessons
  
end
