### Introduction

So, you've now learned a lot of juicy JavaScript, enabling you to make various components of your HTML/CSS page react to user actions and/or input. That's great! As you've seen, you can get your apps to do a lot of pretty cool things already, just using client-side JavaScript. You may have noticed, though, that there is still an important piece of the puzzle missing: unless you use [Local Storage](http://coding.smashingmagazine.com/2010/10/11/local-storage-and-how-to-use-it/), your app 'forgets' the user's preferences, as well as any other changes made, as soon as the page gets reloaded.

While Local Storage is great, it's not ideal: it only stores data on the computer from which the user is accessing the page. This approach does not allow for the app to 'remember' anything when the same user tries to access it again from a different device. For that, you're going to need a real backend.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Understand the various ways to use React in our Rails application.
- Explain how to pass data from your Rails application to React.
- Learn how to integrate React with Rails and handle the CSRF token.

### Building your own backend with Ruby on Rails

Since you've already learned Ruby on Rails in our [full-stack Ruby on Rails path](https://www.theodinproject.com/paths/full-stack-ruby-on-rails), the next step is obvious: you get to build your own backend with Rails! In preparation, reread the [Rails lesson on building an API](https://www.theodinproject.com/lessons/ruby-on-rails-apis-and-building-your-own) to refresh how to set up a Rails backend that can handle JSON requests.

Are you done? Good. Next, it's time to practice allowing your front end JavaScript to talk to your Rails backend using AJAX (asynchronous HTTP requests to a web server using JavaScript without requiring a full page reload).  We'll cover some best practices for how to pass data from one to another and different ways to integrate React with Rails, but otherwise it's up to you: you've got everything you need to put together those final pieces of the web development puzzle.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read thoughtbot's article on ["How to integrate React with Rails 7"](https://thoughtbot.com/blog/how-to-integrate-react-rails) to get an overview of different possibilities.

1. Follow the tutorial in ["How to Build a fullstack Rails 7 backend with React Frontend"](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-ruby-on-rails-v7-project-with-a-react-frontend-on-ubuntu-20-04). It demonstrates how to integrate React with Rails via esbuild, retrieve data from the API layer through an AJAX request using the Fetch API (remember what you learned in the JavaScript lesson ["Working with APIs"](https://www.theodinproject.com/lessons/javascript-working-with-apis)), and handle the CSRF token in non-GET requests.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What possibilities exist to connect a React frontend with a Rails backend?](https://thoughtbot.com/blog/how-to-integrate-react-rails)
- [How do you integrate React with Rails using esbuild?](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-ruby-on-rails-v7-project-with-a-react-frontend-on-ubuntu-20-04#step-3-installing-frontend-dependencies)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [Broaden your knowledge about AJAX requests by skimming working with JavaScript in rails article from RailsGuides](https://guides.rubyonrails.org/v6.1/working_with_javascript_in_rails.html)
- [Grabbing your Rails form CSRF token with JavaScript so Rails doesn't yell at you with "Warning, can't verify CSRF token authenticity", via SO](http://stackoverflow.com/questions/7203304/warning-cant-verify-csrf-token-authenticity-rails)
- [... and another SO post on the CSRF token](http://stackoverflow.com/questions/8503447/rails-how-to-add-csrf-protection-to-forms-created-in-javascript)
