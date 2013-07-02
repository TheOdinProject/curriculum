class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, :only => :scheduler

  def splash
    @splash_email = SplashEmail.new
    @splash = true
  end

  def splash_email
    @splash_email = SplashEmail.new
  end

  def home
    @splash = false
    render "splash"
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

  # For the suggestion form in the footer
  def suggestion
    if params[:suggestion]
      ContactMailer.suggestion_email(params[:suggestion], request.url).deliver!
    end
    respond_to do |format|
      format.json { render json: params[:suggestion] }
    end
  end

end
