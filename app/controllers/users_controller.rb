class UsersController < ApplicationController
  before_action :authenticate_user!
  authorize_resource only: %i[edit update]

  def show
    @courses = decorated_path_courses
  end

  def update
    current_user.update!(user_params)
    render json: current_user
  end

  private

  def decorated_path_courses
    current_user.path.courses.map do |course|
      CourseDecorator.new(course)
    end
  end

  def user_params
    params.require(:user).permit(
      :email,
      :username,
      :password,
      :password_confirmation,
      :learning_goal,
      :uid,
      :provider,
      :path_id,
    )
  end
end
