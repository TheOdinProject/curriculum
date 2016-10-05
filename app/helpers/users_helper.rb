module UsersHelper

  def gravatar_url(user, size)
    GravatarUrlBuilder.new(user, size).url
  end

  def twitter_url(user)
    SocialMediaLink.new(user).twitter_url
  end

  def github_url(user)
    SocialMediaLink.new(user).github_url
  end

  def facebook_url(user)
    SocialMediaLink.new(user).facebook_url
  end

  def linkedin_url(user)
    SocialMediaLink.new(user).linkedin_url
  end

  def lesson_time(user, lesson)
    user.lesson_completion_time(lesson).to_formatted_s(:long)
  end
end
