class PathsController < ApplicationController
  def show
    @path = Path.friendly.find(params[:id])

    if @path.courses.size == 1
      redirect_to path_course_path(@path, @path.courses.first)
    end
  end

  def index
    @paths = Path.order(:position)
  end
end
