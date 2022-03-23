module CourseHelper
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
