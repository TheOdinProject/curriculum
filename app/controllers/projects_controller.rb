class ProjectsController < ApplicationController
  before_action :authenticate_request, except: [:all_submissions]
  before_action :find_lesson
  before_action :find_project, only: [:update, :destroy]

  authorize_resource only: [:update, :destroy]

  def create
    @project = new_project(project_params)
    @project.save
    set_recent_submissions
  end

  def update
    @project.update(project_params)
  end

  def destroy
    @project.destroy
    @project = new_project({})
    set_recent_submissions
  end

  def all_submissions
    submissions = Project.all_submissions(@lesson.id)
    render json: submissions
  end

  private

  def set_recent_submissions
    @submissions = Project.all_submissions(@lesson.id).limit(10)
  end

  def find_project
    @project = Project.find(params[:id])
  end

  def new_project(params)
    project = current_user.projects.new(params)
    project.lesson_id = @lesson.id
    project
  end

  def project_params
    params.require(:project).permit(:repo_url, :live_preview)
  end

  def find_lesson
    @lesson = Lesson.friendly.find(params[:lesson_id])
  end

  def authenticate_request
    return head :unauthorized unless user_signed_in?
  end
end
