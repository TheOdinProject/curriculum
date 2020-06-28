module CourseHelper

  def lesson_completed?(user, lesson)
    if user.completed_lessons.map(&:id).include?(lesson.id)
      "section-lessons__item__icon--completed"
    end
  end

  def numbered_lesson_title(lesson, lesson_index)
    if lesson.is_project?
      "#{lesson_index + 1}. <strong>#{lesson.title}</strong>".html_safe
    else
      "#{lesson_index + 1}. #{lesson.title}".html_safe
    end
  end

  def course_completed_class?(course, user)
    if user_signed_in? && course_completed_by_user?(course, user)
      "course-card-header--completed"
    end
  end

  def open_course_button_style(course, user)
    if user_signed_in? && course_completed_by_user?(course, user)
      'button--transparent'
    else
      'button--secondary'
    end
  end
end
