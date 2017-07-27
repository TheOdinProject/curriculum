module UsersHelper

  def gravatar_url(user, size)
    GravatarUrlBuilder.new(user, size).url
  end

  def lesson_time(user, lesson)
    user.lesson_completion_time(lesson).to_formatted_s(:long)
  end

  def set_learning_goal
    "Set a learning goal in your #{settings_link}.".html_safe
  end

  def avatar_path(avatar)
    avatar || image_path("odin-logo.svg")
  end

  private

  def settings_link
    link_to 'settings', edit_user_registration_path
  end
end
