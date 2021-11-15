class NextLesson
  def initialize(course, lesson_completions)
    @course = course
    @lesson_completions = lesson_completions
  end

  def to_complete
    next_uncompleted_lesson || remaining_lessons_to_complete.first
  end

  private

  attr_reader :course, :lesson_completions

  def next_uncompleted_lesson
    remaining_lessons_to_complete.find do |lesson|
      lesson.position > most_recent_completed_lesson.position
    end
  end

  def remaining_lessons_to_complete
    (course.lessons - lesson_completions.map(&:lesson)).sort_by(&:position)
  end

  def most_recent_completed_lesson
    lesson_completions.max_by(&:created_at).lesson
  end
end
