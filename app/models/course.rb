class Course < ActiveRecord::Base

  serialize :you_learn, Array
  serialize :you_build, Array

  has_many :sections
  has_many :lessons, :through => :sections

  validates_uniqueness_of :position, :message => "Course position has already been taken"

  def percent_completed_by(user)
    uncompleted_lessons_in_course = self.lessons - user.completed_lessons
    100 * (1.0 - uncompleted_lessons_in_course.count.to_f / self.lessons.count.to_f)
  end

end
