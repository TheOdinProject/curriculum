class ProjectsController < ApplicationController
  before_action :authorize_request,
                except: [:all_submissions, :recent_submissions]
  before_action :find_lesson, except: [:update, :destroy]
  before_action :find_project, only: [:update, :destroy]
  authorize_resource only: [:update, :destroy]

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

  def all_submissions
    submissions = Project.all_submissions(@lesson.id)
    render json: submissions
  end

  def recent_submissions
    submissions = Project.all_submissions(@lesson.id).limit(10)
    render json: submissions
  end

  private

  def render_project_json(status)
    render json: @project, status: status
  end

  def render_errors_json
    render json: @project.errors, status: 422
  end

  def find_project
    @project = Project.find(params[:id])
  end

  def new_project
    project = current_user.projects.new(project_params)
    project.lesson_id = @lesson.id
    project
  end

  def project_params
    params.require(:project).permit(:repo_url, :live_preview)
  end

  def find_lesson
    @lesson = Lesson.friendly.find(params[:lesson_id])
  end

  def authorize_request
    head :unauthorized unless user_signed_in?
  end
end
