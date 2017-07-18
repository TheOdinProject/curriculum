class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, except: [:index, :send_confirmation_link]
  authorize_resource only: [:edit, :update]

  def show
    @courses = Course.order(:position)
  end

  def update
    @user.update_attributes!(user_params)
    render json: @user
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
        :uid,
        :provider,
      )
  end

  def find_user
    @user = UserDecorator.new(current_user)
  end
end
