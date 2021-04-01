### Introduction

Remember the warm-up in the previous project when you played with the Flickr API?  Now it's time for you to actually use it.  Huzzah!  You'll create a simple photo widget that allows you to display photos from your Flickr feed (or someone else's). We'll rely on a tutorial for much of the heavy lifting but the principles of what you do here will be repeatable for use with other APIs.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Go back to the [Flickr API Docs](http://www.flickr.com/services/api/) and click [Create an App](http://www.flickr.com/services/apps/create/) at the top.
2. Follow the steps for getting your API key.  You'll have to sign in or sign up for Flickr (someone has to these days) and give them some basic information about your app.  Select "Apply for a non-commercial key" and let them know how awesome your photo feed app will be.  You'll automatically get a key generated for you, in addition to a secret key.  Copy both of these somewhere you can get to them later.
3. While logged in, copy your Flickr ID from the browser address bar by navigating to the "You" link on the top navbar. It will look like `https://www.flickr.com/photos/yourIDhere/`. An example would be `1895558555@N03`. You'll need that later for some of the API methods.
4. Upload a few photos to your photostream!
5. Create a new Rails app and add a gem for the [Flickr API](http://lmgtfy.com/?q=flickr+api+gem). There are gems for pretty much every API out there. They will all require you to include your API keys and secret keys somehow. Look for gems that are maintained (have recent commits) and well-adopted (GitHub stars is one way to get a good gauge for how valuable a gem is). Alternatively, you can browse through [RubyGems](https://rubygems.org/) to see popular gems.
6. One note is that it's not good practice to have your secret key hard coded into your app because then it's hardly a secret, especially if you're pushing to GitHub.  A better practice is to store the key in an [environment variable](http://railsapps.github.io/rails-environment-variables.html) instead and/or use a gem like [`figaro` (see docs)](https://github.com/laserlemon/figaro).  Environment variables allow you to push your key to your app directly from the command line when it fires up.  Figaro operates under the same principle, though it helps you out by allowing you to store the keys in an actual file that just doesn't get committed with the rest of your code.  Use one of these techniques unless you're a cowboy.
7. Build a simple StaticPagesController to display a home page with a simple form.  The form should just be a single text field which takes the ID for a Flickr user.  Once the form is submitted, the page should refresh and display the photos from that user.
8. Ask for your friends' flickr IDs or find random photofeeds on the web.  View them in your app and react appropriately.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.
