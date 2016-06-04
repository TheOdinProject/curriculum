class Course < ActiveRecord::Base

  serialize :you_learn, Array
  serialize :you_build, Array

  has_many :sections
  has_many :lessons, :through => :sections

  validates_uniqueness_of :position

  def percent_completed_by(user)
    100 * (1.0 - uncompleted_lessons_in_course(user) / lessons.count.to_f)
  end

  def lessons_in_course
    lessons.order("position asc")
  end

  def sections_in_course
    sections.order("position asc").includes(:lessons)
  end

  private

  def uncompleted_lessons_in_course(user)
    (lessons - user.completed_lessons).count.to_f
  end
end
