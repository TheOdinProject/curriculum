class SplashEmailsController < ApplicationController

  def create
    splash_email = SplashEmail.new(params[:splash_email])
    if splash_email.save
      flash[:success] = "Thanks! We'll get back to you as soon as we're live!"
      redirect_to root_path
    else
      flash[:error] = "We weren't able to process the request :/"
      redirect_to root_path
    end
  end

end
