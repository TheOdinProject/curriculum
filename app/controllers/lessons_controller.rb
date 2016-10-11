class LessonsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found_error

  def show
    @lesson = Lesson.friendly.find(params[:id])

    if show_ads?
      @lower_banner_ad = true
      @right_box_ad = true
    end
  end

  private

  def show_ads?
    ENV["SHOW_ADS"] && Ad.show_ads?(current_user)
  end
end
