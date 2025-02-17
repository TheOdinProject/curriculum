### Introduction

You may remember testing from the Ruby section and the emphasis on the importance of testing. Similar to that section, testing in Ruby on Rails is important to ensure your application is stable and to catch bugs before you expand your application even more! The first kind of testing that we will cover will be unit tests.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What are unit tests?
- Why are unit tests important?
- Unit tests in the context of Ruby on Rails.

### What are unit tests?

A unit test is testing a single unit of code to ensure that method/unit works as it is supposed to! In Ruby on Rails your models are one of the areas that should be covered with unit tests. These model tests specifically are used to test the logic behind your model objects. This can include validating user inputs from form submissions and other logic between models. Such as if you need to ensure your object method for generating discounts work properly. It's important as you scale your projects to ensure that the logic behind your models works as your project consistently expands. This helps make the project more maintainable as the tests provide a safety net to ensure existing functionality continues working as expected when models need to be expanded or modified. 

Earlier you used RSpec for testing projects in the Ruby section. While Ruby on Rails comes with it's own testing framework. RSpec is a very popular framework for testing even in Ruby on Rail's. As such we will be using RSpec for the Ruby on Rails testing section. 

### Setting up RSpec

Installing RSpec for rails is a relatively straightforward task.

First we add it the development and test group of the gemfile. Navigate to the gemfile and add this to the development/test section.

~~~

group :development, :test do
  gem 'rspec-rails'
end

~~~

Next visit the [rspec-rails installation guide](https://github.com/rspec/rspec-rails#installation) to finish the rest of the steps. Afterwards you will see an additional spec folder on the top level of your project.

There you will find different folders for different areas of your application such as controllers, models, system, etc. When you use the command to generate a model, controller, etc. The spec file will be created in the corresponding folder to the object that you created. If you create a spec file manually, make sure you're creating it in the correct folder, such as a controller spec file within the controller folder. There will also be a rails_helper and spec_helper files. These RSpec files are where you can configure your test environment.

### Example test

Each model should have it's own spec file within the spec/models folder. This will be created when you use the following command.

~~~

rails generate model <model_name>

~~~

Here is an example of what a test should look like. You can find an additional example and other helpful information on the [rspec-rails gem repository](https://github.com/rspec/rspec-rails/tree/6-0-maintenance#rspec-dsl-basics-or-how-do-i-write-a-spec).

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
*   <a class="knowledge-check-link" href="#example-test">How would I test if a post doesn't accept comments?</a>

### Additional Resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- For an example of a model test and having a useful resource. You can visit [code with Jason](https://www.codewithjason.com/a-rails-model-test-hello-world/)
