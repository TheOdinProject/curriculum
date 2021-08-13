module Lessons
  class ProjectSubmissionsController < ApplicationController
    before_action :set_lesson
    before_action :check_if_project_submitable
    before_action :authenticate_user!

    def index
      @project_submissions = Kaminari.paginate_array(
        project_submissions,
        total_count: project_submissions.size
      ).page(params[:page]).per(15)
    end

    private

    def project_submissions
      ::LessonProjectSubmissionsQuery.new(@lesson).with_current_user_submission_first(current_user)
    end

    def set_lesson
      @lesson = Lesson.find(params[:lesson_id])
    end

    def check_if_project_submitable
      return if @lesson.accepts_submission?

      redirect_to(
        path_course_lesson_url(@lesson.course.path, @lesson.course, @lesson),
        alert: 'This project does not accept submissions'
      )
    end
  end
end
