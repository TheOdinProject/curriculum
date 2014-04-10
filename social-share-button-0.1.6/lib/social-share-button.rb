require "social_share_button/version"
require "social_share_button/config"
require "social_share_button/helper"

I18n.load_path += Dir.glob( File.dirname(__FILE__) + "lib/locales/*.{rb,yml}" ) 

module SocialShareButton
  module Rails
    if ::Rails.version < "3.1"
      require "social_share_button/railtie"
    else
      require "social_share_button/engine"
    end
  end
end

ActionView::Base.send :include, SocialShareButton::Helper