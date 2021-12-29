module Lessons
  class ProjectSubmissionsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_lesson
    before_action :check_if_project_submitable

    def index
      @user_submission = user_submission

      @project_submissions = Kaminari.paginate_array(
        public_project_submissions,
        total_count: public_project_submissions.size
      ).page(params[:page]).per(15)
    end

    private

    def user_submission
      submission = project_submissions_query.current_user_submission

      ProjectSubmissionSerializer.as_json(submission, current_user) if submission.present?
    end

    def public_project_submissions
      project_submissions_query.public_submissions
    end

    def project_submissions_query
      @project_submissions_query ||= ::LessonProjectSubmissionsQuery.new(lesson: @lesson, current_user: current_user)
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
