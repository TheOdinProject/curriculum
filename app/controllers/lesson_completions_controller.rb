class LessonCompletionsController < ApplicationController
  
  def create
    # Validate that the id's do in fact correspond to real students and lessons
    @lesson = Lesson.where(:id => params[:lesson_id]).first
    student = User.where(:id => params[:student_id]).first

    if @lesson.nil? || student.nil?
      render :nothing => true, :status => 400 # bad request
    else   
      if student == current_user 
        lc = LessonCompletion.new(:student_id => student.id, :lesson_id => @lesson.id)
        if lc.save
          render "create", :formats => [:js] #:json => lc, :status => 201 # created
        else
          render :nothing => true, :status => 400 # bad request
        end
      else
        render :nothing => true, :status => 401 # unauthorized
      end
    end
  end
end
