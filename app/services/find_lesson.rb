class FindLesson
  attr_reader :lesson, :course
  private :lesson, :course

  def initialize(lesson, course)
    @lesson = lesson
    @course = course
  end

  def next_lesson
    find_next_lesson unless last_lesson?
  end

  private

  def course_lessons
    course.lessons.sort_by(&:position)
  end

  def last_lesson?
    lesson.position == course_lessons.last.position
  end

  def find_next_lesson
    course_lessons.find do |lesson|
      lesson.position == next_lesson_position
    end
  end

  def next_lesson_position
    lesson.position + 1
  end
end
