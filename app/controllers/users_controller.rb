class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, except: [:index]
  authorize_resource only: %i[edit update]

  def show
    @courses = decorated_path_courses
    @path = @user.path
  end

  def update
    @user.update!(user_params)
    render json: @user
  end

  private

  def decorated_path_courses
    @user.path.courses.map do |course|
      CourseDecorator.new(course)
    end
  end

  def courses
    Course.order(:position).includes(:lessons, sections: [:lessons])
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

  def find_user
    @user = UserDecorator.new(user)
  end

  def user
    User.includes(lesson_completions: [lesson: [:course]]).find(current_user.id)
  end
end
