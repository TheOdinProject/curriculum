class CourseProgress
  attr_reader :course, :user
  private :course, :user

  def initialize(course, user)
    @course = course
    @user = user
  end

  def self.course_started?(course, user)
    new(course, user).course_started?
  end

  def self.percentage_completed_by_user(course, user)
    new(course, user).percentage_completed_by_user
  end

  def self.course_completed?(course, user)
    new(course, user).course_completed?
  end

  def course_started?
    percentage_completed_by_user > 0
  end

  def percentage_completed_by_user
    ((100 / number_of_lessons_in_course.to_f) * number_of_lessons_completed).to_i
  end

  def course_completed?
    percentage_completed_by_user == 100
  end

  private

  def number_of_lessons_in_course
    course_lessons.size
  end

  def course_lessons
    course.lessons
  end

  def completed_lessons
    user.completed_lessons
  end

  def number_of_lessons_completed
     (course_lessons & completed_lessons).size
   end
end
