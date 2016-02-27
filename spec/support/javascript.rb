# This file is used to allow us to run Selenium tests
# (which are for testing w/ javascript, noted by :js => true)
# which would otherwise not have access to our recent database 
# operations since the Selenium web browser runs
# in a separate thread from the database transaction
# See http://stackoverflow.com/questions/5433690/capybaraselemium-how-to-initialize-database-in-an-integration-test-code-and-ma

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.before(:each) do |example|
    if example.metadata[:js]
      Capybara.current_driver = :selenium
      DatabaseCleaner.strategy = :truncation
    else
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.start
    end
  end

  config.after(:each) do |example|
    Capybara.use_default_driver if example.metadata[:js]
    DatabaseCleaner.clean
  end
end