module Lessons
  class ProjectSubmissionsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_lesson

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
      @lesson = Lesson.friendly.find(params[:lesson_id])
    end
  end
end
