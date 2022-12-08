### Introduction

You have been introduced to model testing and now we will go over system testing. System testing in short is evaluating how various components of an application behave together. This is distinct from unit tests where your testing a single model method. While individual aspects may work individually they may not behave as expected when integrated together in a test. 

### Lesson Overview

This section contains a general overview of topics that you will learn in this lesson.

-   What are system tests?
-   When should you use system tests.
-   How to make a system test.

### System tests

While system testing is useful for testing how various components of your Ruby on Rails projects works. It's also a useful way of testing how users will use the application and what issues they may encounter along the way. As well as giving you an opportunity to test your application almost as if it was in production. This is crucial for finding bugs that don't occur while unit testing such as making sure users are able to succesfully navigate through the ticket process in flight booker.

### Making a system test

Here we will give an example of what a system test should look like. Note that you will need to go to the spec folder and create a system folder. There is where you will create system tests to test your application. Here is an example below of what that might look like. Note that the names will vary depending on the application. You can find many of the commands for Capybara documented [here on rubydoc.info](https://www.rubydoc.info/gems/capybara/Capybara/Node)

~~~

require "rails_helper"

RSpec.describe 'New article', type: :system do
  #First we specify the type of test.
    describe "Creates new article" do
    #Then we create a block for the related tests.
        it "Succesfully creates a new article" do
          #This will describe your test and the steps you would expect a user to take.
            visit articles_path
            click_on "New Article"
            fill_in "Title", with: "Creating an Article"
            fill_in "Body", with: "Created this article successfully!"
            click_on "Create Article"
            #Finally we assert that the desired outcome of the behavior has been reached.
            assert_text "Creating an Article"
        end
    end
end

~~~

One of the key things to note is that it's almost exactly what a user would do. There are quite a few more additional tools and options so it's worth checking out the documentation to see all the options. It's useful for example in the flight booker project where you may want to test your changes to the ticketing process. Instead of manually going through it every time to make sure it works. You can just create a test suite for this scenario and save yourself some time! Pretty nifty!

### Debugging

One question that may come to mind is how do we debug? One of the useful features of Capybara is that you can find screenshots in the capybara folder within the tmp folder displaying them! This is useful for seeing what the page looked like when it failed. Another useful aspect when debugging is when you pause the tests you can view the page in the browser. Similary to ruby that allows you to freeze the test and check the current variables values. You can use the developer tools check out the web page. This enables you to use all the power the dev tools gives you to see what the issue is _from a user perspective_.

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

* <a class='knowledge-check-link' href='#system-tests'>What are system tests?</a>
* <a class='knowledge-check-link' href='#system-tests'>How are system tests useful?</a>
* <a class='knowledge-check-link' href='#debugging'>What are some tools you would use to debug a system test?</a>

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

-   [While this covers other types of testing. It also has useful system testing information in it](https://www.softwaretestinghelp.com/system-testing/)