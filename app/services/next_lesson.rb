class NextLesson
  def initialize(course, lesson_completions)
    @course = course
    @lesson_completions = lesson_completions
  end

  def to_complete
    next_lesson_to_complete || remaining_lesson_to_complete
  end

  private

  attr_reader :course, :lesson_completions

  def lessons_left_to_complete
    course.lessons - lessons_already_completed
  end

  def lessons_already_completed
    lesson_completions.map(&:lesson)
  end

  def last_lesson_completion
    lesson_completions.max_by(&:created_at)
  end

  def latest_completed_lesson
    last_lesson_completion.lesson
  end

  def next_lesson_to_complete
    FindLesson.new(latest_completed_lesson, course).next_lesson
  end

  def remaining_lesson_to_complete
    lessons_left_to_complete.min_by(&:position)
  end
end
