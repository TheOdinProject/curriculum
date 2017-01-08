class UsersController < ApplicationController
  before_action :find_user, except: [:index, :send_confirmation_link]
  before_action :authenticate_user!
  authorize_resource only: [:edit, :update]

  def show
  end

  def edit
    @edit = true
    render :show
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Your profile was updated successfully'
      redirect_to @user
    else
      flash.now[:error] = "We could not update your profile. Errors: #{@user.errors.full_messages}"
      render :show
    end
  end

  def index
    @users = users_by_latest_lesson_completion
  end

  def send_confirmation_link
    current_user.send_confirmation_instructions
    flash[:notice] = 'Confirmation instructions have been sent to your email address!'
    redirect_to request.referer
  end

  private

  def user_params
    params
      .require(:user)
      .permit(
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
        :provider,
      )
  end

  def find_user
    @user = UserDecorator.new(user)
  end

  def user
    User.find(params[:id])
  end

  def users_by_latest_lesson_completion
    User.by_latest_completion.paginate(page: params[:page], per_page: 15)
  end
end
