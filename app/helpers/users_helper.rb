module UsersHelper

  def gravatar_url(user, size)
    GravatarUrlBuilder.new(user, size).url
  end

  def lesson_time(user, lesson)
    user.lesson_completion_time(lesson).to_formatted_s(:long)
  end

  def set_learning_goal
    link_to "set a learning goal in your settings", edit_user_registration_path, class: 'accent'
  end
end
