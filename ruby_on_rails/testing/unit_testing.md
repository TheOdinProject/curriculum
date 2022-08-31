### Introduction

You may remember testing from the Ruby section and the emphasis on the importance of testing. Similar to that section, testing in Ruby on Rails is important to ensure your application is stable and to catch bugs before you expand your application even more! The first kind of testing that we will cover will be unit tests.

### Lesson Overview

This lesson will cover a few points.

*   What are unit tests?
*   Why are unit tests important?
*   Unit tests in the context of Ruby on Rails.

## What are unit tests?

A unit test is testing a single unit of code to ensure that method/unit works as it is supposed to! In Ruby on Rails you will also hear them reffered to as model tests. These model tests specifically are used to test the logic behind your objects. This can include validating user logins, user form submissions and other logic between models. Such as if you need to ensure your object method for generating discounts work properly. It's important as you scale your projects to ensure that the logic behind your models works as your project consistently expands. This helps make the project more maintainable as bugs will be caught earlier rather than when your project gets larger and those bugs become harder to to debug!

Earlier you used RSpec for testing projects in the Ruby section. While Ruby on Rails comes with it's own testing framework. RSpec is a very popular framework for testing even in Ruby on Rail's. As such we will be using RSpec for the Ruby on Rails testing section. 

## Setting up RSpec

Installing RSpec for rails is a relatively straightforward task.

First we add it the development and test group of the gemfile. Navigate to the gemfile and add this to the development/test section.

~~~

gem 'rspec-rails', '~> 6.0.0'

~~~

Next in your terminal run the following two commands separately.

~~~

bundle install

~~~

~~~

rails generate rspec:install

~~~

Now the appropriate files should have been installed.

## Example test

Each model should have it's own spec file within the spec/models folder. This will be created when you use the following command.

~~~

rails generate model x

~~~

Here is an example of what a test should look like. You can checkout the [gem repository](https://github.com/rspec/rspec-rails/tree/6-0-maintenance) for more information on the gem specifically. 

~~~

RSpec.describe 'Post' do           
  context 'before publication' do  # Explains the context.
    it 'cannot have comments' do   # This is the outome we expect.
      expect { Post.create.comments.create! }.to raise_error(ActiveRecord::RecordInvalid)  
      # Now we should expect RSpec to notify us that the test passed.
    end
  end
end

~~~

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

*   <a class="knowledge-check-link" href="#what-are-unit-tests">What are unit tests?</a>
*   <a class="knowledge-check-link" href="#what-are-unit-tests">Why utilize unit tests?</a>
*   <a class="knowledge-check-link" href="#example-test">How would i test if a post doesn't accept comments?</a>

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

*   It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.