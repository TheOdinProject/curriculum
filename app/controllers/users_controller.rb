class UsersController < ApplicationController

  before_filter :authenticate_user!
  before_filter :check_current_user, :only => [:edit, :update]

  def show
    @user = User.find_by_id(params[:id])
    if @user
      gravatar_hash = Digest::MD5.digest(@user.email.strip.downcase)
      @gravatar_url = "http://www.gravatar.com/avatar/#{gravatar_hash}"
    else
      flash[:error] = "There was no user by that name"
      redirect_to :back
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
    if @user
      gravatar_hash = Digest::MD5.digest(@user.email.strip.downcase)
      @gravatar_url = "http://www.gravatar.com/avatar/#{gravatar_hash}"
    else
      flash[:error] = "There was no user by that name"
      redirect_to :back
    end
    @edit = true
    render :show
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user
      @user.update_attributes(params[:user])
      flash[:success] = "Your profile was updated successfully"
      redirect_to @user
    end
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
