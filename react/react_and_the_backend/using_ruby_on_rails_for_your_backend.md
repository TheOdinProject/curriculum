### Introduction

So, you've now learned a lot of juicy JavaScript, enabling you to make various components of your HTML/CSS page react to user actions and/or input. That's great! As you've seen, you can get your apps to do a lot of pretty cool things already, just using client-side JavaScript. You may have noticed, though, that there is still an important piece of the puzzle missing: unless you use [Local Storage](http://coding.smashingmagazine.com/2010/10/11/local-storage-and-how-to-use-it/), your app 'forgets' the user's preferences, as well as any other changes made, as soon as the page gets reloaded.

While Local Storage is great, it's not ideal: it only stores data on the computer from which the user is accessing the page. This approach does not allow for the app to 'remember' anything when the same user tries to access it again from a different device. For that, you're going to need a real backend.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Explain how "unobtrusive JavaScript" works.
- Explain how to pass data from your Rails application to your JavaScript.
- Explain why you should use AJAX to load large batches of data.

### Building your own backend with Ruby on Rails

Since you've already learned Ruby on Rails in our [full-stack Ruby on Rails path](https://www.theodinproject.com/paths/full-stack-ruby-on-rails), the next step is obvious: you get to build your own backend with Rails! In preparation, reread the [Rails lesson on building an API](https://www.theodinproject.com/lessons/ruby-on-rails-apis-and-building-your-own) to refresh how to set up a Rails backend that can handle JSON requests.

Are you done? Good. Next, it's time to practice allowing your front end JavaScript to talk to your Rails backend using AJAX.  We'll cover some best practices for how to pass data from one to another, but otherwise it's up to you: you've got everything you need to put together those final pieces of the web development puzzle.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. [Check out "Using JavaScript in your Rails App" from Daniel Kehoe](http://railsapps.github.io/rails-javascript-include-external.html). It is long and covers a lot of ground, but it's got great content. Some of the stuff on dependencies can be skimmed, but pay attention to the `content_for` stuff at the bottom.

2. [Refresh yourself on Rails AJAX from RailsGuides](https://guides.rubyonrails.org/v6.1/working_with_javascript_in_rails.html) (just skim the top few sections).

3. Read [Bootstrapping JSON data into a Rails View](https://web.archive.org/web/20221230234727/https://jfire.io/blog/2012/04/30/how-to-securely-bootstrap-json-in-a-rails-view/) to learn about passing data to your front end.

</div>

### Additional resources

This section contains helpful links to other content. It isn't required, so consider it supplemental.

- [How to Build a fullstack Rails 7 backend with React Frontend](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-ruby-on-rails-v7-project-with-a-react-frontend-on-ubuntu-20-04)
- [Grabbing your Rails form CSRF token with JavaScript so Rails doesn't yell at you with "Warning, can't verify CSRF token authenticity", via SO](http://stackoverflow.com/questions/7203304/warning-cant-verify-csrf-token-authenticity-rails)
- [... and another SO post on the CSRF token](http://stackoverflow.com/questions/8503447/rails-how-to-add-csrf-protection-to-forms-created-in-javascript)

### Knowledge check

- <a class="knowledge-check-link" href="https://railsapps.github.io/rails-javascript-include-external.html#locations" > How do you load custom JavaScript in a given Rails view page? </a>
- <a class="knowledge-check-link" href="https://guides.rubyonrails.org/v6.1/working_with_javascript_in_rails.html#unobtrusive-javascript" >How does "unobtrusive JavaScript" work?</a>
- <a class="knowledge-check-link" href="https://railsapps.github.io/rails-javascript-include-external.html#parameters" >How can you pass data from your Rails app to your JavaScript?</a>
- <a class="knowledge-check-link" href="https://guides.rubyonrails.org/v6.1/working_with_javascript_in_rails.html#an-introduction-to-ajax" >Why would you want to use AJAX to load large batches of data?</a>
