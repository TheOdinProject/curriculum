Capybara.default_max_wait_time = 2

Capybara.default_normalize_ws = true

Capybara.save_path = ENV.fetch('CAPYBARA_ARTIFACTS', './tmp/capybara')

Capybara.singleton_class.prepend(Module.new do
  attr_accessor :last_used_session

  def using_session(name, &block)
    self.last_used_session = name
    super
  ensure
    self.last_used_session = nil
  end
end)

Capybara.add_selector(:test_id) do
  css { |value| "[data-test-id='#{value}']" }
end
