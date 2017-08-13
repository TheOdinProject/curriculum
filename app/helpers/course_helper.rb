module CourseHelper

  def lesson_completed?(lesson)
    if current_user.has_completed?(lesson)
      "section-lessons__item__icon--completed"
    end
  end

  def numbered_lesson_title(lesson, lesson_index)
    "#{lesson_index + 1}. #{lesson.title}"
  end

  def percentage_of_course_completed(course)
    if completion_percentage(course) == 100
      "Course Completed!"
    else
      "#{completion_percentage(course)}% Completed"
    end
  end

  private

  def completion_percentage(course)
    course.percent_completed_by(current_user).to_i
  end
end
