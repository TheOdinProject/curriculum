### Introduction

So, you've now learned a lot of juicy JavaScript, enabling you to make various components of your HTML/CSS page react to user actions and/or input. That's great! As you've seen, you can get your apps to do a lot of pretty cool things already, just using client-side JavaScript. You may have noticed, though, that there is still an important piece of the puzzle missing: unless you use [Local Storage](http://coding.smashingmagazine.com/2010/10/11/local-storage-and-how-to-use-it/), your app 'forgets' the user's preferences, as well as any other changes made, as soon as the page gets reloaded.

While Local Storage is great, it's not ideal: it only stores data on the computer from which the user is accessing the page. This approach does not allow for the app to 'remember' anything when the same user tries to access it again from a different device. For that, you're going to need a real backend.

### OK, so ... now what?

Where you go from here will depend in part on what you've learned so far. If you are on the [full-stack Ruby on Rails path](https://www.theodinproject.com/paths/full-stack-ruby-on-rails), hooray: you already have all of the tools you need to build your own full-fledged web app from scratch!

If not, never fear: you can learn how to build a back-end later using [Node.js](https://www.theodinproject.com/courses/nodejs). For now, you can outsource your backend functionality to a Backend-as-a-Service (BaaS) company like [Firebase](https://www.firebase.com/) or [Apigee](http://apigee.com/).

#### Building your own backend with Ruby on Rails

For those of you who are on the [full-stack Ruby on Rails path](https://www.theodinproject.com/paths/full-stack-ruby-on-rails), the next step is obvious: you get to build your own backend with Rails! In preparation, reread the [Rails lesson on building an API](/courses/ruby-on-rails/lessons/apis-and-building-your-own) to refresh how to set up a Rails backend that can handle JSON requests.

Are you done? Good. Next, it's time to practice allowing your front end JavaScript to talk to your Rails backend using AJAX.  We'll cover some best practices for how to pass data from one to another, but otherwise it's up to you: you've got everything you need to put together those final pieces of the web development puzzle.

#### Outsourcing your backend to Firebase

If you skipped Ruby and/or Ruby on Rails or are on the [full-stack JavaScript path](https://www.theodinproject.com/paths/full-stack-javascript), you're not quite ready to build an entire web app from scratch. The good news: you don't have to! We will provide you with resources that guide you through setting up your backend on [Firebase](https://firebase.google.com).

### Learning Outcomes
By the end of this lesson, you should be able to:

#### With Ruby on Rails

 - Explain how "unobtrusive JavaScript" works
 - Explain how to pass data from your Rails application to your JavaScript
 - Explain why you should use AJAX to load large batches of data

#### With Firebase

 - Explain which services are offered by Firebase
 - Explain how to set up your app to use those services from Firebase Hosting
 - Explain how to set up your app to communicate with and/or pass data to and from the various Firebase services

### Assignment

#### With Ruby on Rails

<div class="lesson-content__panel" markdown="1">

1. [Check out "Using JavaScript in your Rails App" from Daniel Kehoe](http://railsapps.github.io/rails-javascript-include-external.html). It is long and covers a lot of ground, but it's got great content. Some of the stuff on dependencies can be skimmed, but pay attention to the `content_for` stuff at the bottom.
2. [Refresh yourself on Rails AJAX from RailsGuides](http://edgeguides.rubyonrails.org/working_with_javascript_in_rails.html) (just skim the top few sections).
3. Read [Bootstrapping JSON data into a Rails View](http://jfire.io/blog/2012/04/30/how-to-securely-bootstrap-json-in-a-rails-view) to learn about passing data to your front end.
</div>

#### With Firebase

<div class="lesson-content__panel" markdown="1">

1. [Explore the different services offered by Firebase](https://firebase.google.com/products). Pay particular attention to [Cloud Firestore](https://firebase.google.com/products/firestore) for now. You may or may not also want to use [Firebase Hosting](https://firebase.google.com/products/hosting) and/or any of the other services offered by Firebase, particularly [Cloud Storage](https://firebase.google.com/products/storage) and [Authentication](https://firebase.google.com/products/auth), but you probably won't need any of those for your first Firebase project.
2. Complete [this Google Codelab](https://codelabs.developers.google.com/codelabs/firebase-web/#0), which will walk you through setting up a sample app on Firebase step by step.
3. Go back to one of the previous projects (e.g. the library project or the to-do app), and [follow this guide](https://firebase.google.com/docs/web/setup?hl=en) to prepare it for interaction with a Firebase backend. 
    * **Caution:** If you're *not* going to be hosting your app on Firebase Hosting, but prefer to leave it where it is (e.g. on GitHub Pages), take a closer look at the section below Step 4, there should be a link, which directs you to the "Available Libraries" page. Then, use what you learned in the codelab to make your own app actually interact with Firebase.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.

#### With Ruby on Rails

* [Grabbing your Rails form CSRF token with JavaScript so Rails doesn't yell at you with "Warning, can't verify CSRF token authenticity", via SO](http://stackoverflow.com/questions/7203304/warning-cant-verify-csrf-token-authenticity-rails)
* [... and another SO post on the CSRF token](http://stackoverflow.com/questions/8503447/rails-how-to-add-csrf-protection-to-forms-created-in-javascript)

#### With Firebase

* This [video](https://www.youtube.com/watch?v=zQyrwxMPm88) to reinforce the learnings from [Google Codelab](https://codelabs.developers.google.com/codelabs/firebase-web/#0).

### Knowledge Check

#### With Ruby on Rails

* <a class="knowledge-check-link" href="https://railsapps.github.io/rails-javascript-include-external.html#locations" > How do you load custom JavaScript in a given Rails view page? </a>
* <a class="knowledge-check-link" href="https://edgeguides.rubyonrails.org/working_with_javascript_in_rails.html#unobtrusive-javascript" >How does "unobtrusive JavaScript" work?</a>
* <a class="knowledge-check-link" href="https://railsapps.github.io/rails-javascript-include-external.html#parameters" >How can you pass data from your Rails app to your JavaScript?</a>
* <a class="knowledge-check-link" href="https://edgeguides.rubyonrails.org/working_with_javascript_in_rails.html#an-introduction-to-ajax" >Why would you want to use AJAX to load large batches of data?</a>

#### With Firebase

 - <a class="knowledge-check-link" href="https://firebase.google.com/products-build" >Which services does Firebase offer?</a>
 - <a class="knowledge-check-link" href="https://firebase.google.com/docs/web/setup?hl=en" >How do you set up your app to use those services from Firebase Hosting and/or from an external host (like GitHub Pages)?</a>
 - <a class="knowledge-check-link" href="https://firebase.google.com/codelabs/firebase-web#5" >How do you get your app to communicate with and/or pass data to and from the various Firebase services?</a>
