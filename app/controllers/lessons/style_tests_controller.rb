class Lessons::StyleTestsController < ApplicationController
  def new; end

  def create
    redirect_to lessons_style_tests_path(url: params[:url])
  end

  def show
    @lesson_content = LessonStyles.render_for(path)
  end

  private

  def path
    URI.parse(params[:url]).path
  end
end
