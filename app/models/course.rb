class Course < ActiveRecord::Base
  attr_accessible :description, :title, :title_url, :position, :you_learn, :you_build, :teaser, :brief_desc, :is_active

  serialize :you_learn, Array
  serialize :you_build, Array

  has_many :sections
  has_many :lessons, :through => :sections

  validates_uniqueness_of :position

end
