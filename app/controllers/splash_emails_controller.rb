class SplashEmailsController < ApplicationController

  def create
    splash_email = SplashEmail.new(params[:splash_email])
    if splash_email.save
      flash.now[:success] = "Success!"
      redirect_to root_path
    else
      flash.now[:error] = "Error"
      redirect_to root_path
    end
  end

end
