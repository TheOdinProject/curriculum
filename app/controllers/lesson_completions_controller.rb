class LessonCompletionsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.lesson_completions.create(lesson_id: lesson.id)

    if redirect_url.present?
      redirect_to redirect_url
    end
  end

  def destroy
    lesson_completion = current_user.lesson_completions.find_by_lesson_id(lesson.id)

    lesson_completion.destroy
    render :create
  end

  private

  def lesson
    @lesson ||= LessonDecorator.new(
      Lesson.friendly.find(params[:lesson_id])
    )
  end

  def redirect_url
    params[:redirect_url]
  end
end
