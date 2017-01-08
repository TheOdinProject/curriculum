class FindLesson
  attr_reader :lesson
  private :lesson

  def initialize(lesson)
    @lesson = lesson
  end

  def next_lesson
    find_lesson(next_lesson_position) unless last_lesson?
  end

  def prev_lesson
    find_lesson(previous_lesson_position) unless first_lesson?
  end

  private

  def first_lesson?
    lesson.position <= 1
  end

  def lessons
    lesson.course.lessons.order(position: :asc)
  end

  def last_lesson?
    lesson.position >= lessons.first.position + lessons.size - 1
  end

  def find_lesson(lesson)
    lessons.find_by_position(lesson)
  end

  def next_lesson_position
    lesson.position + 1
  end

  def previous_lesson_position
    lesson.position - 1
  end
end
