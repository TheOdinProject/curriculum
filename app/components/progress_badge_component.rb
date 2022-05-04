class ProgressBadgeComponent < ViewComponent::Base
  RADIUS = 9

  delegate :user_signed_in?, :percentage_completed_by_user, to: :helpers

  def initialize(course:, current_user:, url:, show_badge: true)
    @course = course
    @current_user = current_user
    @url = url
    @show_badge = show_badge
  end

  private

  attr_reader :course, :current_user, :url, :show_badge

  def circumference
    RADIUS * 2 * Math::PI
  end

  def badge
    @course.badge_uri || fallback_icon
  end

  def borderless_badge
    badge_uri = @course.badge_uri.split('.').first

    "badges/#{badge_uri}-borderless" || fallback_icon
  end

  def fallback_icon
    'icons/odin-icon.svg'
  end

  def show_badge?
    if show_badge || current_user.progress_for(course).completed?
      'visible'
    else
      'invisible'
    end
  end
end
