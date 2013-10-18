class Section < ActiveRecord::Base
  attr_accessible :course_id, :position, :title, :title_url

  belongs_to :course
  has_many :lessons
  
end
