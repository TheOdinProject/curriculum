### Introduction

Remember the warm-up in the previous project when you played with an API? Now it's time to actually use one. Huzzah! For that, we will use another service, called Pexels. You'll create a basic photo widget that allows you to display photos from your Pexels gallery. We'll rely on a tutorial for much of the heavy lifting but the principles of what you do here will be repeatable for use with other APIs.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Start by creating an account on [Pexels](https://www.pexels.com/). Click the "Join" button.
1. Log in and click on the three dots top-right, select ["Image & Video API"](https://www.pexels.com/api/). Next, click the ["Your API Key"](https://www.pexels.com/api/key/) button.
1. You'll have to give them some basic information about your app. Fill the form and let them know how awesome your photo gallery app will be. Click "Generate API Key" to get a key generated for you. Copy it somewhere you can get to it later. You can find it again however, while logged in, by re-visiting ["Your API Key"](https://www.pexels.com/api/key/).
1. Browse the website for some photos then add them to a collection (or upload your own!). Navigate to your created collection, and notice the URL will look like `https://www.pexels.com/collections/collectionTitle-collectionIDhere/`. An example would be `adkmjqz`. You'll need that later for some of the API methods.
1. Create your own client class that interacts with the Pexels API. There are a few HTTP client gems that you can use, such as [Faraday](https://github.com/lostisland/faraday) or [HTTParty](https://github.com/jnunemaker/httparty).

    <div class="lesson-note" markdown="1">

    #### API wrapper gems

    There are, of course, various gems that wraps around a certain API. You can find a number of results of [Pexels API wrapper gems](https://www.google.com/search?q=pexels+api+gem) on Google or on [RubyGems](https://rubygems.org/) and use one of those. While they can make development easier, many wrappers are not very well-maintained if they are not used by many. Thus, they are not safe to install. Be sure that any dependency you use is well-maintained and supported.

    </div>

1. One note is that it's not good practice to have your API key hard coded into your app because then it's hardly a secret, especially if you're pushing to GitHub. A better practice is to store the key in an [environment variable](http://railsapps.github.io/rails-environment-variables.html) or use a gem like [`figaro` (see docs)](https://github.com/laserlemon/figaro). You can read the  [Web Crunch article on Rails credentials](https://web-crunch.com/posts/the-complete-guide-to-ruby-on-rails-encrypted-credentials) as well (although not mentioned in the article, the value of each key can also be accessed by chaining keys as methods as shown in the [Rails Guides](https://guides.rubyonrails.org/security.html#custom-credentials) examples). Environment variables allow you to push your key to your app directly from the command line when it fires up. Figaro operates under the same principle, though it helps you out by allowing you to store the keys in an actual file that just doesn't get committed with the rest of your code. Rails credentials encrypts the keys using the master key. Use one of these techniques unless you're a cowboy.
1. Build a basic StaticPagesController to display a home page with a basic form. The form should just be a single text field which takes the ID for a Pexel collection you have created. Once the form is submitted, the page should refresh and display the photos from that collection.
1. Read [Pexel API docs](https://www.pexels.com/api/documentation/) for more information on how the API works.

</div>
