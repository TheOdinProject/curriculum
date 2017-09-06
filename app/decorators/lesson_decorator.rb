class LessonDecorator < ApplicationDecorator

  def title
    if is_project?
      "Project: #{lesson.title}"
    else
      lesson.title
    end
  end

  def github_url
    'https://github.com/TheOdinProject/curriculum/tree/master' + url
  end

  def course
    CourseDecorator.new(lesson.course)
  end

  private

  def lesson
    __getobj__
  end
end
