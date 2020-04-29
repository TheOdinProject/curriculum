module Notifications
  class LessonCompletion
    def initialize(lesson_completion)
      @lesson_completion = lesson_completion
    end

    def message
      "#{lesson_completion.student.username} has completed #{course_title}: #{lesson_title}"
    end

    private

    attr_reader :lesson_completion

    def course_title
      lesson_completion.lesson.course.title
    end

    def lesson_title
      lesson_completion.lesson.title
    end
  end
end
