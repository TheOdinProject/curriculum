class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, :only => :scheduler

  def home
    @splash_email = SplashEmail.new
  end

  def send_feedback
    if params[:suggestion]
      SplashMailer.splash_suggestion_email(params[:suggestion]).deliver!
    end
    respond_to do |format|
      format.json { render json: params[:suggestion] }
    end
  end

  def scheduler

  end

end
