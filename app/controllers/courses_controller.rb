class CoursesController < ApplicationController

  # The top level page that lists all courses, e.g. Web Development 101, Ruby, Ruby on Rails etc...
  def index
    @courses = Course.order("position asc")
  end

end
