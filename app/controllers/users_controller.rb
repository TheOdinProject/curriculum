class UsersController < ApplicationController

  before_action :set_user, except: [:index, :send_confirmation_link]
  before_action :authenticate_user!
  before_action :check_current_user, :only => [:edit, :update]

  def show
    handle_nil_user if @user.nil?
  end

  def edit
    if @user
      @edit = true
      render :show
    else
      handle_nil_user
    end
  end

  # NOTE: This is actually done by Devise's RegistrationsController
  def update
    if @user.update_attributes( user_params )
      flash[:success] = "Your profile was updated successfully"
      redirect_to @user
    else
      flash.now[:error] = "We could not update your profile.  Errors: #{ @user.errors.full_messages }"
      render :edit
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
        logger.warn "**** redirecting because you (#{current_user.username}) aren't this user! ****"
        redirect_to user
      end
    else
      render "/400.html", :status => 400 # bad request
    end
  end

  def user_params
    params.require(:user).permit(
    :email,
    :username,
    :password,
    :password_confirmation,
    :legal_agreement,
    :skype,
    :screenhero,
    :facebook,
    :twitter,
    :linkedin,
    :github,
    :google_plus,
    :about,
    :uid,
    :provider
  )
  end

  private
    def set_user
      @user = User.find_by_id(params[:id])
    end

    def handle_nil_user
      flash[:error] = "There was no user by that name"
      redirect_to :back
    end
end
