class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all
  end
  

end
