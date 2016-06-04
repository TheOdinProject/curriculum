class LessonsController < ApplicationController

  def index
    @course = find_course

    if @course.nil?
      not_found_error
    end
  end

  def show
    @course = find_course
    @lesson = find_lesson

    if @course.nil? || @lesson.nil?
      not_found_error
    end
    
    @lesson_position_in_section = @lesson.section.lessons.where("is_project = ? AND position <= ?", false, @lesson.position).count
    # puts "\n\nVE BANNER #{Ad.show_ads?(current_user)}!\n\n"
    # puts "ENV: #{ENV['SHOW_ADS']}!!\n\n"
    if ENV["SHOW_ADS"] && Ad.show_ads?(current_user)
      @lower_banner_ad = true # Ad.ve_banner
      @right_box_ad = true # Ad.ve_box
    end
    # puts "\n\nVE: #{Ad.all.inspect} \n\nBANNER AD #{Ad.ve_banner}!\n\n"
  end

  private

  def find_course
    @find_course ||= Course.find_by_title_url!(params[:course_name])
  end

  def find_lesson
    @find_lesson ||= find_course.lessons.find_by_title_url!(params[:lesson_name])
  end

  def not_found_error
    raise ActionController::RoutingError.new('Not Found')
  end

end
