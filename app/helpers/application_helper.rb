module ApplicationHelper

  def title(input = nil)
    title = ""
    if input
      title += input
      title += "  |  The Odin Project"
    elsif @course
      title += "Learn #{@course.title}"
      if @lesson
        title += " -- #{@lesson.title}"
      else
        title += " for Free"
      end
    else
      title = "Learn Web Development for Free Using Ruby on Rails"
      title += "  |  The Odin Project"
    end
    title
  end

  # uses the redcarpet gem to render the markdown as html
  def md(markdown_in)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {:fenced_code_blocks => true})
    markdown.render(markdown_in).html_safe
  end


  # provides the script necessary for single-sign-on
  # with Disqus
  def disqus_sso
    # create a JSON packet of our data attributes

    disqus_secret_key = ENV['DISQUS_API_SECRET_KEY']
    disqus_public_key = ENV['DISQUS_API_PUBLIC_KEY']

    if disqus_secret_key.nil? || disqus_public_key.nil?
      puts "\n\n YOUR DISQUS SECRET OR PUBLIC KEY ARE NOT SET IN YOUR ENVIRONMENT VARIABLES!!! \n\n"
      return nil
    end

    @add_to_avatar = Digest::MD5.hexdigest(current_user.email)
    data = {

      id: "#{current_user.id}",
      username: "#{current_user.username}",
      email: "#{current_user.email}",
      avatar: "http://www.gravatar.com/avatar/#{@add_to_avatar}.png"
    }.to_json
    # encode the data to base64
    message  = Base64.encode64(data).gsub("\n", "")
    # generate a timestamp for signing the message
    timestamp = Time.now.to_i
    # generate our hmac signature
    sig = OpenSSL::HMAC.hexdigest('sha1', disqus_secret_key, '%s %s' % [message, timestamp])

    # return a script tag to insert the sso message
    return "<script type=\"text/javascript\">
        var disqus_config = function() {
            this.page.remote_auth_s3 = \"#{message} #{sig} #{timestamp}\";
            this.page.api_key = \"#{disqus_public_key}\";
        }
      </script>"
  end
end
