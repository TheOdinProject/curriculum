class ProjectsController < ApplicationController
  before_action :authorize_request
  before_action :lookup_lesson
  before_action :lookup_project, only: [:update, :destroy]

  def create
    @project = new_project
    if @project.save
      render_project_json(201)
    else
      render_errors_json
    end
  end

  def update
    if @project.update(project_params)
      render_project_json(200)
    else
      render_errors_json
    end
  end

  def destroy
    @project.destroy
    head :ok
  end

  private

  def render_project_json(status)
    render json: @project, status: status
  end

  def render_errors_json
    render json: @project.errors, status: 422
  end

  def lookup_project
    @project = current_user.projects.where(lesson_id: @lesson.id).first
  end

  def new_project
    project = current_user.projects.new(project_params)
    project.lesson_id = @lesson.id
    project
  end

  def project_params
    params.require(:project).permit(:repo_url, :live_preview)
  end

  def lookup_lesson
    @lesson = Lesson.friendly.find(params[:lesson_id])
  end

  def authorize_request
    head :unauthorized unless user_signed_in?
  end
end
