class SocialMediaLink
  extend Forwardable

  attr_reader :user
  private :user

  def_delegators :user, :twitter, :facebook, :linkedin, :github

  def initialize(user)
    @user = user
  end

  def twitter_url
    twitter && formatted_twitter_url
  end

  def facebook_url
    facebook && "https://www.facebook.com/#{facebook}"
  end

  def linkedin_url
    linkedin && "https://www.linkedin.com/in/#{linkedin}"
  end

  def github_url
    github && formatted_github_url
  end

  private

  def formatted_twitter_url
    if twitter_handle?
      "http://www.twitter.com/#{sanitised_twitter_name}"
    else
      "http://www.twitter.com/#{twitter}"
    end
  end

  def twitter_handle?
    twitter[0] == "@"
  end

  def sanitised_twitter_name
    twitter[1..-1]
  end

  def formatted_github_url
    if valid_github_url?
      github
    else
      "http://www.github.com/#{github}"
    end
  end

  def valid_github_url?
    github[0..3] == "http"
  end
end
