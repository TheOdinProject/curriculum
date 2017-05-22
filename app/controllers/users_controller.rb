class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, except: [:index, :send_confirmation_link]
  authorize_resource only: [:edit, :update]

  def dashboard
    @courses = Course.order(:position)
    @projects = @user.projects
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Your profile was updated successfully'
      redirect_to @user
    else
      flash.now[:error] = "We could not update your profile. Errors: #{@user.errors.full_messages}"
      render :edit
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
        :learning_goal,
        :learning_goal_completion_date,
        :uid,
        :provider,
      )
  end

  def find_user
    @user = UserDecorator.new(current_user)
  end

  def users_by_latest_lesson_completion
    User.by_latest_completion.paginate(page: params[:page], per_page: 15)
  end
end
