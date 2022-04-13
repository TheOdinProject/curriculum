module AnnouncementHelper
  def disabled_announcement_ids
    announcement_cookies.filter_map { |cookie| cookie[1].to_i }
  end

  private

  def announcement_cookies
    cookies.filter_map { |name, _| name.match(/^announcement_(\d+)/) }.compact
  end
end
