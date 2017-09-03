module LessonsHelper

  def next_lesson_button_state(lesson)
    if current_user&.has_completed?(lesson)
      'button--primary'
    else
      'button--secondary'
    end
  end
end
