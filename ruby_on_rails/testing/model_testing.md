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

The first tool that we are going to use to set up the data is [factory bot](https://github.com/thoughtbot/factory_bot). Factory bot is a gem that you can use to set up test data and create necessary data for your tests. Adding Factory bot is similar to adding other testing gems. Add the following line to the to the following section in your Gemfile.

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

Make sure to require this file in `rails_helper.rb`. We will briefly cover what a factory will look like and some things to keep in mind when creating your data. While you can require the file by adding `require support/factory_bot` to the top of the file. Rails also provides this in the commented out line `Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }` which enables you to load all of the support files when booting up. This is useful for not having to manually add all of the support files and avoids issues if you forget to add a file for example. The last thing you might be wondering is how the test database clears itself in between it's tests. Rail's does this automatically for you, however if Rail's is not doing it for you make sure your following the instructions in the rails_helper.rb file and make sure to ask in the [Discord](https://discord.com/channels/505093832157691914/690591236922409012)! There is also a alternative option in the additional resources section if need be for database cleaning.

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

When creating a factory bot record you have the choice of using the `create(:user)` which returns a saved instance of the object from your database or `build(:user)` which returns an unsaved instance of an object. You might be wondering how we avoid objects hanging around in the database. Thankfully RSpec includes the ability to clear the database in between tests. However if you do find that RSpec's database clearing isn't fitting your needs here you can check the additional resources for alternatives.

## Example model test

When testing our models we usually want to focus on testing the business logic. Essentially what goes on behind each model that enables the user experience to work correctly. This could mean ensuring promotion tickets prices are correct, only correct form data is accepted, custom user verification etc. Below are a few examples along with an explanation to explain it more in depth. It's important to note that each model should have it's own file in the `spec/models` file. This is helpful for keeping your model tests organized and readable.

This is the failing example where we expect the pass to not pass.

~~~

#first we would want to check our spec/factories file.
#To make sure it's set up properly.
#It should look like the following.

FactoryBot.define do

  factory :user do 
    user_name { "userwithout a number" }
  end 

end

RSpec.describe User, type: :model do
  #define test expectations
  it "verifies the user has a number."
  #We then build a user.
    user = build(:user) 
    #Then we check for the expected outcome.
    expect(user.save). to eql(false)
  end
end

~~~

To break it down a little bit further first we define what we expect the result to be in the `it "verifies the user has a number."`. After describing the expected outcome we build a user. It's important to note while you can save the object to the database in this case we only are testing it's attributes and thus don't need to save it to the database when creating it. In fact the final step where we are verifying a user we test whether we can save it at all. Notice how in the factory bot file we don't add a number and thus when we save we expect Rails to return false. So the next question is how do we test this without creating another factory in the factory bot file? Let's run another example.

~~~

#For this passing test we can keep the factory as is.

FactoryBot.define do

  factory :user do 
    user_name { "userwithout a number" }
  end 

end

RSpec.describe User, type: :model do
  #define test expectations
  it "verifies the user has a number."
  #We then build a user. 
  #However this time we add or change the attributes as needed.
    user = build(:user, user_name: "userwitha1") 
    #Then we check for the expected outcome.
    expect(user.save). to eql(true)
  end
end

~~~

A key difference to note is that when building the user we add a number. Therefore unlike the previous example the user can be saved and therefore the save is successful and Rails return true. However you might be wondering how this connects back to our models as the tests defines our user model. If the test fails then you would go back to your model file in the app and make the necessary adjustments to pass the test. The Factory bot [repository](https://github.com/thoughtbot/factory_bot/blob/main/GETTING_STARTED.md#setup) has excellent information for diving in deeper and it's highly reccomended to read through it to understand factory bot better. As well as keeping the RSpec [documentation](https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers) handy when you need to look up the various matchers for your test or another aspect of RSpec.

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

*   <a class="knowledge-check-link" href="#what-are-model-tests">What are model tests?</a>
*   <a class="knowledge-check-link" href="#creating-a-factory">How would I create a factory to use in my tests?</a>
*   <a class="knowledge-check-link" href="#example-model-test">What are some examples of testing business logic?</a>

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

*   For an example of a model test and having a useful resource. You can visit [code with Jason](https://www.codewithjason.com/write-model-tests-part/).
*   For an alternative if RSpecs built in database cleaner isn't working for testing. You can find it [here](https://github.com/DatabaseCleaner/database_cleaner).