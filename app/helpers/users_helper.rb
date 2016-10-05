module UsersHelper

  def gravatar_url(user, size)
    GravatarUrlBuilder.new(user, size).url
  end

  def twitter_url(user)
    social_media_link.new(user).twitter_url
  end

  def github_url(user)
    social_media_link.new(user).github_url
  end

  def facebook_url(user)
    social_media_link.new(user).facebook_url
  end

  def linkedin_url(user)
    social_media_link.new(user).linkedin_url
  end

  def lesson_time(user, lesson)
    user.lesson_completion_time(lesson).to_formatted_s(:long)
  end

  private

  def social_media_link
    SocialMediaLink
  end
end
