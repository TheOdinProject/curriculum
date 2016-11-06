class LessonCompletionsController < ApplicationController
  before_action :authenticate_request
  before_action :lookup_lesson

  def create
    new_lesson_completion.save
    render :create, formats: [:js]
  end

  def destroy
    lesson_completion.destroy
    render :create, formats: [:js]
  end

  private

  def lesson_completion
    LessonCompletion.where(student_id: current_user.id, lesson_id: @lesson.id).first
  end

  def new_lesson_completion
    LessonCompletion.new(student_id: current_user.id, lesson_id: @lesson.id)
  end

  def lookup_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def authenticate_request
    head :unauthorized unless user_signed_in?
  end
end
