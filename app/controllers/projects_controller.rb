class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_lesson
  before_action :find_project, only: %i(update destroy)

  def index
    @projects = all_projects.page(params[:page]).per(50)
    @course = CourseDecorator.new(@lesson.course)
    @user = current_user
    @project = @projects.where(user_id: current_user.id).first if current_user
  end

  def create
    project = current_user.projects.create!(project_params)
    render json: { project: ProjectSerializer.as_json(project) }, status: :ok
  end

  def update
    @project.update(project_params)

    render json: { project: ProjectSerializer.as_json(@project) }, status: :ok
  end

  def destroy
    @project.destroy

    render json: { message: 'removed' }, status: :ok
  end

  private

  def all_projects
    Project.all_submissions(@lesson.id).order(updated_at: :desc)
  end

  def new_project(parameters = {})
    current_user.projects.new(parameters).tap do |project|
      project.lesson_id = @lesson.id
    end
  end

  def latest_projects
    all_projects.limit(10)
  end

  def find_project
    @project = Project.find(params[:id])
  end

  def find_lesson
    @lesson = LessonDecorator.new(lesson)
  end

  def lesson
    Lesson.friendly.find(params[:lesson_id])
  end

  def project_params
    params.require(:project).permit(
      :repo_url,
      :live_preview_url,
      :is_public,
      :lesson_id
    )
  end
end
