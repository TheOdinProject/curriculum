module Lessons
  class TitleLinkComponent < ViewComponent::Base
    def initialize(lesson:, lesson_number:)
      @lesson = lesson
      @lesson_number = lesson_number
    end

    def title
      if lesson.is_project?
        content_tag(:strong, "Project: #{lesson.title}")
      else
        lesson.title
      end
    end

    private

    attr_reader :lesson, :lesson_number
  end
end
