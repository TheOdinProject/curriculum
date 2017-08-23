class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, except: [:index]
  authorize_resource only: [:edit, :update]

  def show
    @courses = Course.order(:position)
  end

  def update
    @user.update_attributes!(user_params)
    render json: @user
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
        :learning_goal,
        :uid,
        :provider,
      )
  end

  def find_user
    @user = UserDecorator.new(current_user)
  end
end
