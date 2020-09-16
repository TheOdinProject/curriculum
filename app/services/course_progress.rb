class CourseProgress
  def initialize(course, user)
    @course = course
    @user = user
  end

  def started?
    completed_lessons.positive?
  end

  def completed?
    pending_lessons.zero?
  end

  def percentage
    (100.0 * completed_lessons / total_lessons).to_i
  end

  private

  attr_reader :course, :user

  def lesson_ids
    @lesson_ids ||= course.lesson_ids
  end

  def total_lessons
    @total_lessons ||= lesson_ids.size
  end

  def completed_lessons
    @completed_lessons ||= user.lesson_completions.where(lesson_id: lesson_ids).size
  end

  def pending_lessons
    total_lessons - completed_lessons
  end
end
