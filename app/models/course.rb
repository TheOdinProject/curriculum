class Course < ActiveRecord::Base
  attr_accessible :description, :title

  has_many :sections
  has_many :lessons, :through => :sections

end
