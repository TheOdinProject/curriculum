class Section < ActiveRecord::Base
  attr_accessible :course_id, :position, :title, :title_url, :description

  belongs_to :course
  has_many :lessons
  
end
