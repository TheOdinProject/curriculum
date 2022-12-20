### Introduction

The last lesson covered unit testing and now we will move into model testing. Here you will get an idea of how to test within Rails for model testing as well as a deeper dive of how to structure these tests.

### Lesson Overview

This section contains a general overview of topics that you will learn in this lesson.

*   What are model tests?
*   How do I run a model test?
*   How to structure model testing?

## What are model tests?

A model test is a unit test in the context of Ruby on Rails. Model tests in this case are designed to test the business logic of your models. Let's say you need to test a custom validation method for your blog post. In this case you would need to reach into the model aspect of your testing skillset. Before you write the RSpec there will be a few tools you will need to familiarize yourself with.

## Setting the test

The first tool that we are going to use to set up the data is factory bot. Factory bot is a gem that you can use to set up test data and create necessary data for your tests. Adding Factory bot is similar to adding other testing gems. Add the following line to the to the following section in your Gemfile.

~~~

group :development, :test do

  gem "factory_bot_rails"  #Add this line.

end

~~~

Then in your terminal enter `bundle install` to the terminal where it will install the gem. Now we need to move into setting up our test configuration to utilize Factory bot. First were going to navigate to `spec/support/factory_bot.rb` and add the following configuration. 

~~~

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

~~~

Make sure to require this file in `rails_helper.rb`. We will briefly cover what a factory will look like and some things to keep in mind when creating your data. 

## Creating a factory

Below is an example of a user factory. Notice that the factory will be a User class based off of the name of your factory. You can also define as many attributes as you want and it can be useful to focus on adding only the attributes your testing and adding them as need be.

~~~

# This will guess the User class
FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name  { "Doe" }
    admin { false }
  end
end

~~~

When creating a factory bot record you have the choice of using the `create(:user)` which returns a saved instance of the object from your database or `build(:user)` which returns an unsaved instance of an object. You might be wondering how we avoid objects hanging around in the database. Thankfully RSpec includes the ability to clear the database in between tests. However if you do find that RSpec's database clearing isn't fitting your needs here is a alternative.

navigating to the Gemfile we will want to install the `database_cleaner` gem and this is what we will use to clean our databases between our test runs. Navigate to the Gemfile and add the following gem to the test and development group then in your console enter `bundle install` to add the Gem.

~~~

group :development, :test do
  gem 'database_cleaner-active_record' #Add this line. 
end

~~~

You will also need to navigate to your `rails_helper` file and change `config.use_transactional_fixtures` to false. Then go to the `support` folder in your spec folder and create a `database_cleaner.rb` file. This is where we will add the following configuration to clear out the test data.

~~~

RSpec.configure do |config|
    config.before(:suite) do
      DatabaseCleaner.clean_with(:truncation)
      Rails.application.load_seed
    end
  
    config.before(:each) do
      DatabaseCleaner.strategy = :transaction
    end
  
    config.before(:each, :js => true) do
      DatabaseCleaner.strategy = :truncation
    end
  
    config.before(:each) do
      DatabaseCleaner.start
    end
  
    config.after(:each) do
      DatabaseCleaner.clean
    end
  end

~~~

  Now your finally done configuring your tests and can set up your first one!

## Example model test

When testing our models we usually want to focus on testing the business logic. Essentially what goes on behind each model that enables the user experience to work correctly. This could mean ensuring promotion tickets prices are correct, only correct form data is accepted, custom user verification etc. In the context of a user it would like like the following. It's important to note that each model should have it's own file in the `spec/models` file. This is helpful for keeping your model tests organized and readable.

~~~

RSpec.describe User, type: :model do
  it "verifies the user has a number."
    user = build(:user, user_name: "Forbidden username!") 
    expect(user.save). to eql(false)
  end
end

~~~

here we use build instead of create to test if it can be saved. You can also set attributes when creating or building the model object. This is useful for ensuring our user model will only accept certain attributes if we want to make a custom validation method. In this case we pass in a username with a forbidden character such as ! and it should fail to save. The Factory bot [repository](https://github.com/thoughtbot/factory_bot/blob/main/GETTING_STARTED.md#setup) has excellent information for diving in deeper and it's highly reccomended to read through it to understand factory bot better. As well as keeping the RSpec [documentation](https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers) handy when you need to look up the various matchers for your test or another aspect of RSpec.

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

*   <a class="knowledge-check-link" href="#what-are-model-tests">What are model tests?</a>
*   <a class="knowledge-check-link" href="#creating-a-factory">How would I create a factory to use in my tests?</a>
*   <a class="knowledge-check-link" href="#example-model-test">What are some examples of testing business logic?</a>

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

*   For an example of a model test and having a useful resource. You can visit [code with Jason](https://www.codewithjason.com/write-model-tests-part/).