module UsersHelper
  def gravatar_url(user, size)
      gravatar_hash = Digest::MD5.digest(user.email.strip.downcase)
      gravatar_url = "http://www.gravatar.com/avatar/#{gravatar_hash}?s=#{size}"
  end
end
