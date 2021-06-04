module AdminFlashHelper
  def disabled_flash_ids_from_cookies
    admin_flash_cookies.filter_map { |cookie| cookie[1].to_i }
  end

  private

  def admin_flash_cookies
    cookies.filter_map { |name, _| name.match(/admin_flash_(\d+)/) }.compact
  end
end
