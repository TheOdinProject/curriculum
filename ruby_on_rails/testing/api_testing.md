### Introduction

This section will cover what api testing is, how you can set up a test and how api testing is useful. With you being able to add them to your own project as well!

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

*   What are api tests?
*   How to set up a model test?
*   How to use api tests?

### What are api tests

Api tests otherwise known as application program interface tests the ability of an application to respond to requests. For example you might want to test if your application returns the right title from your newly created book when requested. In this case api tests would be specifically addressing this need to test the applications response rather than just the model itself.

### Setting up api tests

Similar to model tests we will place the tests in the spec folder under `spec/requests`. Before we run the necessary tests however we need to set up our `spec/support/factories` file as shown below. Something to keep in mind as well is that while this example uses POST, there are also the other requests of GET(requesting data), DELETE(deleting data) and PUT(updating data).

~~~

FactoryBot.define do

    factory :post do
      title { "bob" }
      content { "bob" }
    end
  end

~~~

Now that we have created our factory we can set up our test to run. One important thing to remember is we want to follow single-responsibility principle so we test the different type of requests separately. In this instance were creating a post through factory bot and testing to ensure our object with the proper parameters are accepted. After we create the object we then check to ensure that the title matches the one we expect.

~~~

RSpec.describe 'Posts', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:my_post) { FactoryBot.create(:post) }

      before do
        post '/api/v1/posts', params:
                          { post: {
                            title: my_post.title,
                            content: my_post.content
                          } }
      end

      it 'returns the title' do
        expect(my_post['title']).to eq(my_post.title)
      end
    end
  end 
end

~~~


### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

* <a class="knowledge-check-link" href="#what-are-api-tests">What are api tests?</a>
* <a class="knowledge-check-link" href="#what-are-api-tests">What are api tests useful for your application?</a>
* <a class="knowledge-check-link" href="#setting-up-api-tests">Should you tests the response types separately?</a>

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

*  Great overall [resource](https://rubyyagi.com/rspec-request-spec/) on how to write api tests.

*  Good [resource](https://www.betterspecs.org/#matchers) for best practices on writing Rails tests.
