class LessonsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_error

  def show
    @lesson = Lesson.friendly.find(params[:id])

    return unless show_ads?
    @lower_banner_ad = true
    @right_box_ad = true
  end

  private

  def show_ads?
    ENV['SHOW_ADS'] && Ad.show_ads?
  end
end
