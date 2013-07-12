class UsersController < ApplicationController

  before_filter :authenticate_user!
  before_filter :check_current_user, :only => [:edit, :update]

  def show
    @user = User.find_by_id(params[:id])
    if @user.nil?
      flash[:error] = "There was no user by that name"
      redirect_to :back
    else
      gravatar_hash = Digest::MD5.digest(@user.email.strip.downcase)
      @gravatar_url = "http://www.gravatar.com/avatar/#{gravatar_hash}"
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
    if @user.nil?
      flash[:error] = "There was no user by that name"
      redirect_to :back
    else
      gravatar_hash = Digest::MD5.digest(@user.email.strip.downcase)
      @gravatar_url = "http://www.gravatar.com/avatar/#{gravatar_hash}"
    end
    @edit = true
    render :show
  end

  protected

  def check_current_user
    user = User.find_by_id(params[:id]) || bad_request
    if user
      unless current_user == User.find(params[:id])
        redirect_to User.find(params[:id]) 
      end
    else
      render "/400.html", :status => 400 # bad request
    end
  end

end
