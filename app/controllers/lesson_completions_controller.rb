class LessonCompletionsController < ApplicationController
  before_action :authenticate_request
  before_action :lookup_lesson
  before_action :set_user

  def create
    new_lesson_completion.save
  end

  def destroy
    lesson_completion.destroy
    render :create
  end

  private

  def lesson_completion
    LessonCompletion.where(
      student_id: @user.id,
      lesson_id: @lesson.id
    ).first
  end

  def set_user
      @user = User.includes(:lesson_completions).find(current_user.id)
  end

  def new_lesson_completion
    LessonCompletion.new(student_id: current_user.id, lesson_id: @lesson.id)
  end

  def lookup_lesson
    @lesson = LessonDecorator.new(lesson)
  end

  def lesson
    Lesson.friendly.find(params[:lesson_id])
  end

  def authenticate_request
    head :unauthorized unless user_signed_in?
  end
end
