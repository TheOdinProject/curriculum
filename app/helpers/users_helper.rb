module UsersHelper

  def lesson_time(user, lesson)
    user.lesson_completion_time(lesson).to_formatted_s(:long)
  end

  def display_dashboard_learning_goal(user)
    if user.learning_goal.blank?
      "Set a learning goal in your #{settings_link}.".html_safe
    else
      user.learning_goal
    end
  end

  def display_learning_goal(user)
    if user.learning_goal.blank?
      "No learning goal set yet."
    else
      user.learning_goal
    end
  end

  def avatar_path(avatar)
    avatar || image_path("odin-logo.svg")
  end

  private

  def settings_link
    link_to 'settings', edit_user_registration_path, class: 'profile-card__link'
  end
end
