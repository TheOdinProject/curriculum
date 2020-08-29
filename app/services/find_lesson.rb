class FindLesson
  attr_reader :current_lesson, :course
  private :current_lesson, :course

  def initialize(current_lesson, course)
    @current_lesson = current_lesson
    @course = course
  end

  def next_lesson
    return if last_lesson?

    course_lessons.find do |lesson|
      lesson.position == current_lesson.position + 1
    end
  end

  def previous_lesson
    return if first_lesson?

    course_lessons.find do |lesson|
      lesson.position == current_lesson.position - 1
    end
  end

  private

  def course_lessons
    course.lessons.sort_by(&:position)
  end

  def last_lesson?
    current_lesson.position == course_lessons.last.position
  end

  def first_lesson?
    current_lesson.position == course_lessons.first.position
  end
end
