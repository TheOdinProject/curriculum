class SplashEmailsController < ApplicationController

  def create
    splash_email = SplashEmail.new(params[:splash_email])
    if splash_email.save
      redirect_to thank_you_path
    else
      flash[:error] = "Yarg! We had a problem! : /"
      redirect_to root_path
    end
  end

end
