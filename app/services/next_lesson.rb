class NextLesson
  attr_reader :course, :lesson_completions
  private :course, :lesson_completions

  def initialize(course, lesson_completions)
    @course = course
    @lesson_completions = lesson_completions
  end

  def lesson_to_complete
    course.lessons.find do |lesson|
      lesson.position == next_lesson_to_complete_position
    end
  end

  private

  def completed_lessons_in_course
    lesson_completions.select do |lesson_completion|
      lesson_completion.lesson.course.id == course.id
    end
  end

  def completed_lessons_by_date
    completed_lessons_in_course.sort_by(&:created_at)
  end

  def last_lesson_completed
    completed_lessons_by_date.last
  end

  def next_lesson_to_complete_position
    last_lesson_completed.lesson.position + 1
  end
end



# pass in the course and the completed lessons
# extract all completed lessons from the course
# I could go for the section id
