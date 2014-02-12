class LessonCompletionsController < ApplicationController
  
  before_filter :authenticate_request
  
  def create
    # Validate that the id's do in fact correspond to real students and lessons
    @lesson = Lesson.where(:id => params[:lesson_id]).first
    student = User.where(:id => params[:student_id]).first

    if @lesson.nil? || student.nil?
      render :nothing => true, :status => 400 # bad request
    else   
      lc = LessonCompletion.new(:student_id => student.id, :lesson_id => @lesson.id)
      if lc.save
        render "create", :formats => [:js] #:json => lc, :status => 201 # created
      else
        render :nothing => true, :status => 400 # bad request
      end
    end
  end
  
  def destroy
    
  end

  private
    def authenticate_request
      unless user_signed_in?
        render :nothing => true, :status => 401 # unauthorized
      end
    end
end