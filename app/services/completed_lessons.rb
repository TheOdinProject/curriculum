class CompletedLessons
  attr_reader :user, :course

  def initialize(course, user)
    @course, @user = course, user
  end

  def for_course
    users_completed_lessons.select do |lesson_completion|
      lesson_completion.lesson.course.id == course.id
    end
  end

  private

  def users_completed_lessons
    user.lesson_completions
  end
end
