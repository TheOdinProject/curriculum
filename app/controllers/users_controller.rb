class UsersController < ApplicationController

  before_filter :authenticate_user!
  before_filter :check_current_user, :only => [:edit, :update]

  def show
    @user = User.find_by_id(params[:id])
    if @user
    else
      flash[:error] = "There was no user by that name"
      redirect_to :back
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
    if @user
      @edit = true
      render :show
    else
      flash[:error] = "There was no user by that name"
      redirect_to :back
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user
      @user.update_attributes(params[:user])
      flash[:success] = "Your profile was updated successfully"
      redirect_to @user
    end
  end

  def index
    # Grab students and order by most recent lesson completion
    # @users = User.where.not(:last_sign_in_at => nil).order("last_sign_in_at desc").paginate(:page => params[:page], :per_page => 15)
    @users = User.by_latest_completion.paginate(:page => params[:page], :per_page => 15)
  end

  def send_confirmation_link
    current_user.send_confirmation_instructions
    flash[:notice] = "Confirmation instructions have been sent to your email address!"
    redirect_to request.referer
  end

  protected

  def check_current_user
    user = User.find_by_id(params[:id]) || bad_request
    if user
      unless current_user == user
        # puts "**** redirecting because you aren't this user! ****"
        logger.warn "**** redirecting because you (#{current_user.username}) aren't this user! ****"
        redirect_to user
      end
    else
      render "/400.html", :status => 400 # bad request
    end
  end

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :legal_agreement)
  end
end
