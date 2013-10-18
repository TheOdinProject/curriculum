class Lesson < ActiveRecord::Base
  attr_accessible :course_id, :description, :is_project, :position, :section_id, :title, :url, :title_url

  belongs_to :section
  has_one :course, :through => :section

end
