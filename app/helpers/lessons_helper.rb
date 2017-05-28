module LessonsHelper
  def course_url(lesson)
    link_to 'View Course',
      course_path(lesson.course.title_url, ref: 'lnav'),
      title: "Go back to '#{lesson.course.title}'",
      class: 'button button--secondary'
  end

  def next_lesson_url(lesson)
    link_to 'Next Lesson',
      course_lesson_path(lesson.course, lesson.next_lesson, ref: 'lnav'),
      title: "Move on to '#{lesson.next_lesson.title}'",
      class: 'button button--secondary'
  end
end
