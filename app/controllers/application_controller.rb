class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :catch_referral_codes

  include BootstrapFlashHelper
  include ApplicationHelper

  # Customize Devise to send signed out users to the home page not root
  def after_sign_out_path_for(resource_or_scope)
    home_path
  end

  # Customize Devise to send newly signed in users to the home page
  def after_sign_in_path_for(resource_or_scope)
    home_path
  end

  # redirects to error pages
  def bad_request
    #redirect_to "#{Rails.root}/public/400.html"
    raise ActionController::RoutingError.new('Bad Request')
  end

  protected

  def catch_referral_codes
    ref_codes = ["cb"]  # add any referral codes later here
    used_codes = ref_codes & params.keys
    return unless used_codes.size > 0
    
    used_codes.each do |code|

      # validate particular cases
      if code == "cb"
        next if ContentBucket.find_by_id(params["cb"]).nil?
        cookies["cb"] = {   :value => params["cb"], 
                            :expires => 1.day.from_now  }
      end

    end

  end

end
