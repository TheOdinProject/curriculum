class GravatarUrlBuilder
  attr_reader :user, :size
  private :user, :size

  def initialize(user, size)
    @user, @size = user, size
  end

  def url
    "http://www.gravatar.com/avatar/#{gravatar_hash}?s=#{size}&d=#{default_url}"
  end

  private

  def gravatar_hash
    Digest::MD5.hexdigest(sanitised_user_email)
  end

  def sanitised_user_email
    user.email.strip.downcase
  end

  def default_url
    "http://www.gravatar.com/avatar/436053b3e050d4156773bc04cfb167fe?s=#{size}"
  end
end
