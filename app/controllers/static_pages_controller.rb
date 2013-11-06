class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, :only => :scheduler

  def splash
    if user_signed_in?
      redirect_to :scheduler
    end
  end

  def splash_email
    @splash_email = SplashEmail.new
  end

  def home
    @navbar = false
  end

  def scheduler

    unless cookies["cb"].blank?
      cb = ContentBucket.find_by_id(cookies["cb"])
      if cb 
        unless current_user.content_buckets.include?(cb)
          current_user.content_buckets << cb
          flash.now[:success] = "We've added #{cb.name} to your list of projects.  To change or remove projects, #{view_context.link_to 'click here', edit_user_pref_path}."
        end
      else
        flash.now[:warning] = "We couldn't identify the project you linked from... try manually adding it in your #{view_context.link_to 'preferences page', edit_user_pref_path}"
      end
      cookies["cb"] = nil
    end
  end

  def about

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
