module LessonsHelper
  def next_lesson_button_state(lesson)
    if current_user&.completed?(lesson)
      'button--primary'
    else
      'button--secondary'
    end
  end

  def github_edit_url(lesson)
    github_link("curriculum/edit/master#{lesson.url}")
  end
end
