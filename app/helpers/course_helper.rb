module CourseHelper
  def numbered_lesson_title(lesson, lesson_index)
    if lesson.is_project?
      "#{lesson_index + 1}. <strong>#{lesson.title}</strong>"
    else
      "#{lesson_index + 1}. #{lesson.title}"
    end
  end

  def course_completed_class?(course, user)
    'course-card-header--completed' if user_signed_in? && course_completed_by_user?(course, user)
  end

  def open_course_button_style(course, user)
    if user_signed_in? && course_completed_by_user?(course, user)
      'button--transparent'
    else
      'button--secondary'
    end
  end
end
