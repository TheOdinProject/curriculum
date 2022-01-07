module UsersHelper
  def display_dashboard_learning_goal(user)
    user.learning_goal.presence || "Set a learning goal in your #{settings_link}."
  end

  def display_learning_goal(user)
    user.learning_goal.presence || 'No learning goal set yet.'
  end

  private

  def settings_link
    link_to 'settings', edit_user_registration_path, class: 'profile-card__link'
  end
end
