require 'rubygems'
require 'base64'
require 'cgi'
require 'openssl'
require "json"

class ForumsController < ApplicationController

  DISQUS_SECRET_KEY = ENV['DISQUS_API_SECRET_KEY']
  DISQUS_PUBLIC_KEY = ENV['DISQUS_API_PUBLIC_KEY']

  def show
    @discusjs = disqus_sso
  end

  private

  def disqus_sso
    # create a JSON packet of our data attributes
    data = {
      id: "#{current_user.id}",
      username: "#{current_user.username}",
      email: "#{current_user.email}"
    }.to_json
    # encode the data to base64
    message  = Base64.encode64(data).gsub("\n", "")
    # generate a timestamp for signing the message
    timestamp = Time.now.to_i
    # generate our hmac signature
    sig = OpenSSL::HMAC.hexdigest('sha1', DISQUS_SECRET_KEY, '%s %s' % [message, timestamp])

    # return a script tag to insert the sso message
    return "<script type=\"text/javascript\">
        var disqus_config = function() {
            this.page.remote_auth_s3 = \"#{message} #{sig} #{timestamp}\";
            this.page.api_key = \"#{DISQUS_PUBLIC_KEY}\";
        }
      </script>"
  end

end
