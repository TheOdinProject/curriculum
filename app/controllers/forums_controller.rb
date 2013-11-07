class ForumsController < ApplicationController

  def show
    @is_forum = true;
    @moot_hash = generate_moot_hash
    # puts "\n\n\n @moot_hash is #{@moot_hash}!! \n\n\n"
  end

  private

  def generate_moot_hash
    # Based on info from https://moot.it/docs/single-sign-on.html

    return {} unless user_signed_in?

    # timestamp (in seconds). Improves security.
    timestamp = Time.now.to_i
     
    # SSO object contains the user information, where
    #
    # - id identifies the user. A different id represents a different user
    # - displayname is the full name
    # - is_admin, `true` gives administrative rights.
    sso = {
       :user => {
          :id => "#{current_user.id}", # required
          :displayname => "#{current_user.username}", # required
          :email => "#{current_user.email}",
          :avatar => '//gravatar.com/avatar/e5fb96fe7ec4ac3d4fa675422f8d1fb9',
          :is_admin => false,
       }
    }
     
    # The SSO object as base64 encoded string. Not readable by humans.
    message = Base64.strict_encode64 sso.to_json
     
    # The SSO object is coupled with a hashed signature. This must always be
    # generated on the server since the provided secret key should not be seen
    # by anyone else but you.
    signature = Digest::SHA1.hexdigest "#{ENV['moot_secret_key']} #{message} #{timestamp}"
     

    return {
      :timestamp => timestamp,
      :signature => signature,
      :message => message,
      :api_key => ENV['moot_api_key']
    }

  end

end
