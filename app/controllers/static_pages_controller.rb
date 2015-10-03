class StaticPagesController < ApplicationController

  def home
    @navbar = false
    @is_home_page = true
  end

  def about
  end
  
  def studygroups
  end

  def legal
  end

  def tou
  end

  def cla
  end

  # For the suggestion form in the footer
  def suggestion
    if user_signed_in?
      user = current_user.email
    else
      user = "< not logged in >"
    end

    if params[:suggestion]
      ContactMailer.suggestion_email(params[:suggestion], params[:pathname], user).deliver!
    end
    respond_to do |format|
      format.json { render json: params[:suggestion] }
    end
  end
end
