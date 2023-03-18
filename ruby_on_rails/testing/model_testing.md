### Introduction

The last lesson covered unit testing and now we will move into model testing. Here you will get an idea of how to test within Rails for model testing as well as a deeper dive of how to structure these tests.

### Lesson Overview

This section contains a general overview of topics that you will learn in this lesson.

*   What are model tests?
*   How do I run a model test?
*   How to structure model testing?

## What are model tests?

A model test is a unit test in the context of Ruby on Rails. When testing our models we usually want to focus on testing the business logic. Essentially what goes on behind each model that enables the user experience to work correctly. This could mean ensuring promotion tickets prices are correct, only correct form data is accepted, custom user verification etc. It's important to note that each model should have it's own file in the `spec/models` file. This is helpful for keeping your model tests organized and readable.

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

Make sure to require this file in `rails_helper.rb`. We will briefly cover what a factory will look like and some things to keep in mind when creating your data. While you can require the file by adding `require support/factory_bot` to the top of the file. Rails also provides this in the commented out line `Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }` which enables you to load all of the support files when booting up. This is useful for not having to manually add all of the support files and avoids issues if you forget to add a file for example. 

The last thing you might be wondering is how the test database clears itself in between it's tests. Rail's does this automatically for you, however if Rail's is not doing it for you make sure your following the instructions in the rails_helper.rb file and make sure to ask in the [Discord](https://discord.com/channels/505093832157691914/690591236922409012) first! There is also a alternative option in the additional resources section if need be for database cleaning.

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

When creating a factory bot record you have the choice of using the `create(:user)` which returns a saved instance of the object from your database or `build(:user)` which returns an unsaved instance of an object. 

## Example model test

In the following example one of the things we often see when users sign up is that sites will ask for an email to send a user notifications for example. RSpec can help you test this by utilizing model tests. Let's take a look at what a requiring a user email would look like in a model and the corresponding tests. 

~~~

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors.add attribute, (options[:message] || "is not an email")
    end
  end
end

class User < ApplicationRecord
  validates :email, presence: true, email: true
end

~~~
 
In the above code we add our own validator to the email validation. [Validate each](https://guides.rubyonrails.org/active_record_validations.html#custom-validators). By using validate the model will call on the validator to ensure the presence of valid characters. That then brings us to the following RSpec test where we will write the context and what we expect the outcome to be. The validate_each method is also where you would make changes as well if the test failed to pass.

~~~

RSpec.describe User, type: :model do
  describe '#valid?' do
    context "when the user does not have an email address" do
      user =  build(:user)

      it "will not be valid" do
        expect(user.valid?).to be false
      end
    end
    
    context "when the user has an email address" do
      user =  build(:user, email_address: "jdoe@example.com")

      it "will be valid" do
        expect(user.valid?).to be true 
      end
    end
  end
end

~~~ 

One thing to note is that we have two tests. We want to test both that it only accepts valid characters while having a separate test for rejecting the invalid ones. The other thing to note is that you can set attributes when creating a factory record as well rather than going back to the factory file. The Factory bot [repository](https://github.com/thoughtbot/factory_bot/blob/main/GETTING_STARTED.md#setup) has excellent information for diving in deeper and it's highly reccomended to read through it to understand factory bot better. 

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

*   <a class="knowledge-check-link" href="#what-are-model-tests">What are model tests?</a>
*   <a class="knowledge-check-link" href="#creating-a-factory">How would I create a factory to use in my tests?</a>
*   <a class="knowledge-check-link" href="#example-model-test">What are some examples of testing business logic?</a>

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

*   For an example of a model test and having a useful resource. You can visit [code with Jason](https://www.codewithjason.com/write-model-tests-part/).
*   For an alternative if RSpecs built in database cleaner isn't working for testing. You can find it [here](https://github.com/DatabaseCleaner/database_cleaner).