module CourseHelper

  def lesson_completed?(user, lesson)
    if user.completed_lessons.map(&:id).include?(lesson.id)
      "section-lessons__item__icon--completed"
    end
  end

  def numbered_lesson_title(lesson, lesson_index)
    "#{lesson_index + 1}. #{lesson.title}"
  end
end
