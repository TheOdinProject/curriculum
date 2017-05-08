module UsersHelper

  def gravatar_url(user, size)
    GravatarUrlBuilder.new(user, size).url
  end

  def lesson_time(user, lesson)
    user.lesson_completion_time(lesson).to_formatted_s(:long)
  end

  def format_completion_date
    'test test test'
  end
end
