class LessonCompletionsController < ApplicationController
  
  before_action :authenticate_request
  before_action :lookup_lesson
  
  def create
    @course = @lesson.course
    @next_lesson = @lesson.next_lesson
    lc = LessonCompletion.new(:student_id => current_user.id, :lesson_id => @lesson.id)
    if lc.save
      render :create, formats: [:js]
    else
      head :bad_request
    end
  end
  
  def destroy
    @course = @lesson.course
    @next_lesson = @lesson.next_lesson
    lc = LessonCompletion.where(:student_id => current_user.id, :lesson_id => @lesson.id).
                          first
    if lc.nil?
      head :bad_request
    else
      lc.destroy
      render :create, formats: [:js]
    end
  end

  private

    def lookup_lesson
      begin
        @lesson = Lesson.find(params[:lesson_id])
      rescue ActiveRecord::RecordNotFound
        head :bad_request
      end
    end

    def authenticate_request
      head :unauthorized unless user_signed_in?
    end
end