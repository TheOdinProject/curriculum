# Automatically wait for AJAX requests
# See https://robots.thoughtbot.com/automatically-wait-for-ajax-with-capybara

module AjaxHelpers
  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
  
  def reload_page
    page.evaluate_script('window.location.reload()')
  end
end

World AjaxHelpers