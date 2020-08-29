class CompletedLessons
  def initialize(course, user)
    @course = course
    @user = user
  end

  def for_course
    users_completed_lessons.select do |lesson_completion|
      lesson_completion.lesson.course.id == course.id
    end
  end

  private

  attr_reader :user, :course

  def users_completed_lessons
    user.lesson_completions
  end
end
