class Section < ActiveRecord::Base
  attr_accessible :course_id, :position, :title, :title_url, :description

  belongs_to :course
  has_many :lessons

  validates_uniqueness_of :position, :message => "Section position has already been taken"
  
end
