class LessonCompletionsController < ApplicationController
  
  before_filter :authenticate_request
  
  def create
    # Validate that the id does in fact correspond to a real lesson
    # Note that the authentication before_filter makes sure we've got a current_user
    @lesson = Lesson.where(:id => params[:lesson_id]).first

    if @lesson.nil?
      render :nothing => true, :status => 400 # bad request
    else   
      @course = @lesson.course
      @next_lesson = @lesson.next_lesson
      lc = LessonCompletion.new(:student_id => current_user.id, :lesson_id => @lesson.id)
      if lc.save
        render "create", :formats => [:js]
      else
        render :nothing => true, :status => 400 # bad request
      end
    end
  end
  
  def destroy
    # Validate that the id does in fact correspond to a real lessons
    # Note that the authentication before_filter makes sure we've got a current_user
    @lesson = Lesson.where(:id => params[:lesson_id]).first

    if @lesson.nil?
      render :nothing => true, :status => 400 # bad request
    else   
      @course = @lesson.course
      @next_lesson = @lesson.next_lesson
      lc = LessonCompletion.where(:student_id => current_user.id, :lesson_id => @lesson.id).first
      if lc.nil? 
        render :nothing => true, :status => 400 # bad request
      elsif lc.delete
        render "create", :formats => [:js] 
      else
        render :nothing => true, :status => 400 # bad request
      end
    end
  end

  private
    def authenticate_request
      unless user_signed_in?
        render :nothing => true, :status => 401 # unauthorized
      end
    end
end