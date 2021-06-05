class LessonCompletionsController < ApplicationController
  before_action :authenticate_user!

  # rubocop: disable Metrics/AbcSize
  def create
    # raise params.inspect
    current_user.lesson_completions.create(
      lesson_id: lesson.id,
      lesson_identifier_uuid: lesson.identifier_uuid,
      course_id: lesson.course.id,
      path_id: lesson.course.path.id,
    )

    if redirect_url.present?
      redirect_to redirect_url
    end
  end
  # rubocop: enable Metrics/AbcSize

  def destroy
    lesson_completion = current_user.lesson_completions.find_by(lesson_id: lesson.id)

    lesson_completion.destroy
    render :create
  end

  private

  def lesson
    @lesson ||= LessonDecorator.new(
      Lesson.find(params[:lesson_id])
    )
  end

  def redirect_url
    params[:redirect_url]
  end
end
