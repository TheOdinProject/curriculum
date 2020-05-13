### Introduction

So, you've now learned a lot of juicy Javascript, enabling you to make various components of your HTML/CSS page react to user actions and/or input. That's great! As you've seen, you can get your apps to do a lot of pretty cool things already, just using client-side JavaScript. You may have noticed, though, that there is still an important piece of the puzzle missing: unless you use [Local Storage](http://coding.smashingmagazine.com/2010/10/11/local-storage-and-how-to-use-it/), your app 'forgets' the user's preferences, as well as any other changes made, as soon as the page gets reloaded.

While Local Storage is great, it's not ideal: it only stores data on the computer from which the user is accessing the page. This approach does not allow for the app to 'remember' anything when the same user tries to access it again from a different device. For that, you're going to need a real backend.   

### OK, so ... now what? 

Where you go from here will depend in part on what you've learned so far. If you are on the [full-stack Ruby on Rails track](https://www.theodinproject.com/tracks/full-stack-ruby-on-rails), hooray: you already have all of the tools you need to build your own full-fledged web app from scratch! 

If not, never fear: you can learn how to build a back-end later using [Node.js](https://www.theodinproject.com/courses/nodejs) ... or you may decide to learn Ruby on Rails after all. For now, you can outsource your backend functionality to a Backend-as-a-Service (BaaS) company like [Firebase](https://www.firebase.com/) or [Apigee](http://apigee.com/). 

#### Building your own backend with Ruby on Rails

For those of you who are on the [full-stack Ruby on Rails track](https://www.theodinproject.com/tracks/full-stack-ruby-on-rails), the next step is obvious: you get to build your own backend with Rails! In preparation, reread the [Rails lesson on building an API](/courses/ruby-on-rails/lessons/apis-and-building-your-own) to refresh how to set up a Rails backend that can handle JSON requests.

Are you done? Good. Next, it's time to practice allowing your front end Javascript to talk to your Rails backend using AJAX.  We'll cover some best practices for how to pass data from one to another, but otherwise it's up to you: you've got everything you need to put together those final pieces of the web development puzzle.

#### Outsourcing your backend to Firebase

If you skipped Ruby and/or Ruby on Rails and are on the [Full Stack JavaScript](https://www.theodinproject.com/tracks/full-stack-javascript) or [Front End Only](https://www.theodinproject.com/tracks/front-end-only) track, you're not quite ready to build an entire web app from scratch. The good news: you don't have to! We will provide you with resources that guide you through setting up your backend on [Firebase](https://firebase.google.com). 

### Learning Outcomes

#### With Ruby on Rails

* Refresher -- how do you set up a basic Rails app?
* Refresher -- how do you load custom Javascript in a given Rails view page?
* How does "unobtrusive Javascript" work?
* How can you pass data from your Rails app to your Javascript?
* Why would you want to use AJAX to load large batches of data?

#### With Firebase

* Which services does Firebase offer? 
* How do you set up your app to use those services from Firebase Hosting and/or from an external host (like GitHub Pages)?
* How do you get your app to communicate with and/or pass data to and from the various Firebase services?  

### Assignment

#### With Ruby on Rails

<div class="lesson-content__panel" markdown="1">
1. [Check out "Using Javascript in your Rails App" from Daniel Kehoe](http://railsapps.github.io/rails-javascript-include-external.html).  It is long and covers a lot of ground, but it's got great content.  Some of the stuff on dependencies can be skimmed, but pay attention to the `content_for` stuff at the bottom.
2. [Refresh yourself on Rails AJAX from RailsGuides](http://edgeguides.rubyonrails.org/working_with_javascript_in_rails.html) (just skim the top few sections).
3. Read [Bootstrapping JSON data into a Rails View](http://jfire.io/blog/2012/04/30/how-to-securely-bootstrap-json-in-a-rails-view) to learn about passing data to your front end.
</div>

#### With Firebase

<div class="lesson-content__panel" markdown="1">
1. [Explore the different services offered by Firebase](https://firebase.google.com/products). Pay particular attention to [Cloud Firestore](https://firebase.google.com/products/firestore) for now. You may or may not also want to use [Firebase Hosting](https://firebase.google.com/products/hosting) and/or any of the other services offered by Firebase, particularly [Cloud Storage](https://firebase.google.com/products/storage) and [Authentication](https://firebase.google.com/products/auth), but you probably won't need any of those for your first Firebase project.
2. If this is your first ever encounter with Firebase, we encourage you to do [this Google Codelab](https://codelabs.developers.google.com/codelabs/firebase-web/#0), which will walk you through setting up a sample app on Firebase step by step.
3. If you haven't already integrated one of your previous projects with Firebase, go back to one of them now (e.g. the library project or the to-do app), and [follow this guide](https://firebase.google.com/docs/web/setup?hl=en) to prepare it for interaction with a Firebase backend. **Caution:** if you're *not* going to be hosting your app on Firebase Hosting, but prefer to leave it where it is (e.g. on GitHub Pages), make sure to click the 'from the CDN' tab in step 3! Then, use what you learned in the codelab to make your own app actually interact with Firebase. 
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* [Grabbing your Rails form CSRF token with Javascript so Rails doesn't yell at you with "Warning, can't verify CSRF token authenticity", via SO](http://stackoverflow.com/questions/7203304/warning-cant-verify-csrf-token-authenticity-rails)
* [... and another SO post on the CSRF token](http://stackoverflow.com/questions/8503447/rails-how-to-add-csrf-protection-to-forms-created-in-javascript)


