module CourseHelper

  def lesson_completed?(lesson)
    if current_user.has_completed?(lesson)
      "section-lessons__item__icon--completed"
    end
  end

  def numbered_lesson_title(lesson, lesson_index)
    "#{lesson_index + 1}. #{lesson.title}"
  end
end
