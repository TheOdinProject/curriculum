class Course < ActiveRecord::Base
  attr_accessible :description, :title, :title_url

  has_many :sections
  has_many :lessons, :through => :sections

end
