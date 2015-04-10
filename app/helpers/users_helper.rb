module UsersHelper
  def gravatar_url(user, size)
    gravatar_hash = Digest::MD5.hexdigest(user.email.strip.downcase)
    default_url = "http://www.gravatar.com/avatar/436053b3e050d4156773bc04cfb167fe?s=#{size}"
    # #{root_url}assets/odin_head_silhouette_2_pale.gif
    gravatar_url = "http://www.gravatar.com/avatar/#{gravatar_hash}?s=#{size}&d=#{default_url}"
  end

  def twitter_url(user)
    url = ""
    if user.twitter
      if user.twitter[0] == "@"
        url = "http://www.twitter.com/#{user.twitter[1..-1]}"
      else
        url = "http://www.twitter.com/#{user.twitter}"
      end
    end
  end 

  def github_url(user)
    url = ""
    if user.github
      url = "http://www.github.com/#{user.github}"
    end
  end

  def facebook_url(user)
    url = ""
    if user.facebook
      url = "https://www.facebook.com/#{user.facebook}"
    end
  end
  def linkedin_url(user)
    url = ""
    if user.linkedin
      url = "https://www.linkedin.com/in/#{user.linkedin}"
    end
  end
  def lesson_time(user, lesson)
    time = user.lesson_completion_time(lesson)
    time.to_formatted_s(:long)
  end
end
