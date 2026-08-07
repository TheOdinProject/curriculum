### Introduction

This section will cover what integration testing is, an example of a test and how integration testing is useful. With you being able to add them to your own project as well!

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

*   What are Integration tests?
*   When to use integration tests?
*   What are some of the checkable attributes during a integration test?
*   What does an integration test look like?

### What is Integration testing

Integration testing involves testing multiple components of software of your project to ensure they work together as intended. As your building up your projects they will most likely involve multiple controllers and models. Integration testing is one type of tests that will enable you to ensure these different components work together well. An example of this is you may want to test that you can get a list of all the users. A unit test can tell you if a user can created, _but_ it doesn't tell you if the routes have been correctly set to get that user data nor if your view file will actually show the full list of users.

In this case an Integration test would test both the controller, view file and your model to check that both work together as intended to get that user information. Thankfully RSpec provdes a useful tool in the form of request specs. This is RSpec's form of integration tests and allows you test the stack including routing. Hence you can test whether or not that list of users can be retrieved sucessfully and the corresponding HTTP response from the browser.

### What to Test

There are a few different things worth testing using request specs. The first one is invalid and valid parameters. For example if we have a blog we want to make sure out articles have a title. In this case we would use integration testing to ensure when trying to create a article without a title it will reject it and have some sort of notification for said user. The opposite is also true as well and we would want to test that it creates a article only when the valid parameters are sent through our controllers and recieved by our model. This is very important as we want users to only be able to create accounts with acceptable parameters such as a strong password. This extends to testing _accessing_ an account as well and anything that requires authentication such as user logins, deleting a user account, updating a user account etc. 

Some of these are also known as the HTTP verbs GET(get a user), POST(post the created user), PUT(update the user), or DELETE(remove the user), which are mentioned in the [routing](https://www.theodinproject.com/lessons/ruby-on-rails-routing) lesson earlier. These are the type of requests you would commonly expect to see and are useful ones to test. After all we want to make sure that we are able to do all of these things with a user and that only authenticated users can do such as only the users themselves being able to delete their account only when logged in or an admin doing it. RSpec fortunately allows us to test these type of requests/make these integration tests alongside with a few other tools which we will go over.

### Request Attributes

One of the great things about using RSpec is that you can see the response. So this can give you an insight into how your application responds during the tests. Through this response you can see a few things such as the body, header, status etc. Whereas model tests would test only that model, doing an Integration test will allow to view a wide range of behaviors alongside the HTTP response. Going back to the example of testing whether a user is created. You might expect the response body to contain a success message that the user was created or maybe simply a flash message on the page. In this case with an integration test you would want to test that both the model, controller, routes and view file works together. 

You can also view a variety of other attributes from the response such as cookies and session values as well. Similar to how in Ruby you would use the debugger to pause your test and your able to see the values. You can look at the values in the terminal and well as check that these values were sucessfully sent back when the page was loaded. For example you may want to check that your cookie is present when a user engages in a certain behavior on the website such as a pop-up message when a specific page is reached with that cookie.Let's look at an example of what a integration test would look like in the next part.

### Integration Test example

Before we dive into the example their are two gems we want to add in order to be able to do integration tests. they are [`selenium-webdriver`](https://github.com/teamcapybara/capybara) and (`capybara`)[https://github.com/teamcapybara/capybara#selenium]. `capybara` is what will interact with the webpage and selenium-webdriver which will enable `capybara` to interact with external resources as well if your tests involve any. This is the primary advantage of choosing this over the built in driver as it cannot interact with external resources.

~~~
#Simply add the gems to the development and test section in your gemfile.
group :development, :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end

~~~

Now let's move onto the test!

~~~

require 'rails_helper'
RSpec.describe "home page", :type => :request do
  it "displays the user's username after successful login" do
    user = create(:user, username: "jdoe", password: "secret")
    visit "/login"
    fill_in "Username", :with => "jdoe"
    fill_in "Password", :with => "secret"
    click_button "Log in"
    expect(page).to have_selector(".header .username", :text => "jdoe")
    expect(response).to have_http_status(:ok)
  end
end

~~~

One of the first things you will notice is the usage of visit. This is allows us to test that our controller and routes are successfully set up to navigate to that page i.e. make a GET request. We then use Capybara to fill in the username and password of that page to ensure we are able to GET the user information, but also that it can be POSTed as well i.e. the user was created. You can view some more of the commands for navigating through the pages during testing with capybara [here](https://www.rubydoc.info/gems/capybara/Capybara/Node/Element) Since were testing multiple parts we _want to to essentially navigate through the interface allowing us to see the response and how the parts work together_. Our application will give us a response containing both the username and the http status of okay i.e. we were able to GET the user information sucessfully. This tells us a few things, first that we can navigate to the login page with our controller, That our application is able to appropriately respond to the request, our view file is able to display the appropiate information. 

Most importantly it shows that our controller, routes, and authentication method work appropriately when integrated _together_. As such integration tests are useful for authentication or important flows in your application where you would expect multiple parts to be working together. Whereas model testing or unit testing would test a single model and it's method without seeing how it fits into the wider application. A great way of thinking of it is like a opening a toy model that you have to an assemble. You can have the model, but integration testing is similar to where you have the instructions to make the parts fit together to make the model, you would use integration tests to test that different aspects of your project work together and therefore build a more resilient application. 


### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

* <a class="knowledge-check-link" href="#what-is-integration-testing">What are integration tests?</a>
* <a class="knowledge-check-link" href="#when-to-use-integration-tests">When to use Integration testing?</a>
* <a class="knowledge-check-link" href="#request-attributes">Can you view cookies during the test?</a>
* <a class="knowledge-check-link" href="#what-to-test">Should we test authentication?</a>
* <a class="knowledge-check-link" href="#integration-test-example">What is a useful way of thinking about Integration tests?</a>

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

*  Great refresher [resource](https://thoughtbot.com/blog/rspec-integration-tests-with-capybara) on how to write RSpec tests.

*  Good [resource](https://www.betterspecs.org) for best practices on writing Rails tests.
