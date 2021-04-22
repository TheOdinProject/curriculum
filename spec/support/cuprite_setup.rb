require 'capybara/cuprite'

Capybara.register_driver(:cuprite) do |app|
  Capybara::Cuprite::Driver.new(
    app,
    **{
      window_size: [1200, 1200],
      browser_options: {},
      process_timeout: 30,
      timeout: 60,
      inspector: true,
      headless: !ENV['HEADLESS'].in?(%w[n 0 no false]),
      js_errors: true
    }
  )
end

Capybara.default_driver = :cuprite
Capybara.javascript_driver = :cuprite

module CupriteHelpers
  def pause
    page.driver.pause
  end

  def debug(*args)
    page.driver.debug(*args)
  end
end

RSpec.configure do |config|
  config.prepend_before(:each, type: :system) do
    driven_by :cuprite
  end

  config.include CupriteHelpers, type: :system
end
