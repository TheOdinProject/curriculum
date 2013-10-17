class Course < ActiveRecord::Base
  attr_accessible :description, :title

  has_many :lessons
  has_many :sections

end
