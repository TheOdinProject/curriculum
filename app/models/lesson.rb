class Lesson < ActiveRecord::Base
  attr_accessible :course_id, :description, :is_project, :position, :section_id, :title, :url

  belongs_to :section
  belongs_to :course, :through => :section

end
