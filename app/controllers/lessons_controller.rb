class LessonsController < ApplicationController
  def show
    @lesson = decorated_lesson

    if user_signed_in?
      @project_submissions = public_project_submissions
      @user_submission = current_user_submission
    end
  end

  private

  def public_project_submissions
    project_submissions_query.public_submissions.map do |submission|
      ProjectSubmissionSerializer.as_json(submission, current_user) if submission.present?
    end
  end

  def current_user_submission
    submission = project_submissions_query.current_user_submission

    ProjectSubmissionSerializer.as_json(submission, current_user) if submission.present?
  end

  def project_submissions_query
    ::LessonProjectSubmissionsQuery.new(lesson: @lesson, current_user: current_user, limit: 10)
  end

  def decorated_lesson
    LessonDecorator.new(lesson)
  end

  def lesson
    course.lessons.find(params[:id])
  end

  def course
    Path.find(params[:path_id]).courses.find(params[:course_id])
  end
end
