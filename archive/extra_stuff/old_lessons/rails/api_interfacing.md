### Introduction

It's pretty easy to turn your application into an API, but what about grabbing data from other APIs across the internet?  That's where things usually get a bit more challenging because they're all different and you've got to authenticate yourself.

Most popular services offer APIs so developers can interface with them (they love it if you can get more people using their platform).  Facebook, Twitter, Instagram, Flickr, Dropbox, AirBnB... They've all got APIs.  Just Google "companyX API docs" and you'll get to their developers section.

If you go to the documentation for an API, it can sometimes be a bit overwhelming because much of the material sort of assumes that you know what you're doing, but some are definitely better than others.  There are also elements that are common across almost all of them.  The more you work with APIs (and get the hang of the authentication flow), the easier they get.  You'll be making mashups in no time.

This lesson will cover some general steps that are common across APIs and will do high level overviews of some of the methods for authenticating with APIs like Omniauth.  Try to gain as much conceptual understanding as you can here and use the documentation each gem or API provides to help with the implementation.  If you find great free learning resources that explain APIs, please let us know [(make a pull request and add an additional resource at the bottom of this page)](https://github.com/TheOdinProject/curriculum)!

### Learning Outcomes
Look through these now and then use them to test yourself after doing the assignment.

* What's the best way to locate an API's docs?
* What are the steps you'll almost always have to go through when setting up your app to use an API?
* What is an API key?
* How is API use typically controlled?
* How do you avoid including an API's secret token in your Github repo (e.g. hard coding it)?
* Why is it important to know which API version you're using?
* What is a RESTful API and why does that make your life easier?
* What (basically) is OAuth?
* Why would a user prefer to sign into your site using Facebook instead of giving you a new password?
* How (basically) does this process work from the user's perspective?
* How (basically) does this process work from your (the application developer's) perspective?
* What are the basic rules of thumb for not abusing APIs?
* What is OmniAuth and why does it save you tons of time/pain?
* What is an SDK and why are they useful for working with APIs?

### First Steps

You will need to register yourself and your application with the API provider.  They will track and monitor your usage this way.  Typically, there is a free tier of usage and it will cost you if you're going over your limits, whether they are expressed in terms of total MB downloaded, number of requests, or number of transactions (for instance).  Usually, even if you're a user of their service, you will need to separately go to their developer portal.

You will need to get an **API key** from the API provider, which often is the last part of registration.  This key will uniquely identify your application to the API provider and you will send it along with every request.  It's sort of like a user on your site automatically submitting their session cookie with each request so you know they're logged in.  

You'll typically also get a "secret key" or similarly named code.  Whereas the API key is usually public, the secret key is an added layer of security that's required for the more secure APIs and you will use it to generate a cryptographic token that authenticates any requests you make.  You will need to make sure you don't include this secret key in your Git repo!  Use the `figaro` gem or environment variables to put the key on the server instead of hard coding it.

### API Rates and Security Tokens

Most APIs require a different type of "security clearance" for different requests:  

1. You can usually make innocuous requests like asking for Tweets (with Twitter's API of course) with straightforward and unauthenticated GET requests.  You can make these from any command line or a browser tool like [Chrome's Rest Client](http://getpostman.com). These types of API requests are usually severely rate limited to incentivize you to sign up.  
2. The next layer is making requests that include your API key. These are still usually fairly innocuous things (like getting public data) and limited by the API's pricing tiers.
3. More sensitive requests like asking for specific user data or submitting/modifying/deleting data will likely require you to use an authentication process involving your secret token.  We'll cover the basics of this in the project.  Rates for these requests are subject to the API pricing tiers.
4. Oftentimes, you actually want to make requests on behalf of a user.  For instance, showing a user a dashboard of all his tweets and Facebook posts together would require asking Twitter for that user's tweets and Facebook for that user's posts.  This can involve a LOT of requests over a large user base, but luckily you're actually able to make them on the user's behalf by asking for the user's permission.  We'll cover this as well later, but basically you send the user to the API provider's site to sign in, then the API provider will give you a user-specific token to use when making requests on their behalf in the future.  Rates for this are usually more advantageous because they are covered in a per-user bucket.  We typically use the OAuth protocol for this, as described below.

### Versions

Tech companies, especially if they've been around for a while, typically have several versions of their API.  Usually, they built a first draft version when they were a startup and then had to build a real one later, but still have to support the original since so many other applications are likely to be using it.  

Just go for the latest version unless you have a compelling reason not to (it's usually got a separate section of documentation for each version).  Pay attention to which version's docs you're looking at... there's nothing like the frustration of realizing you've been looking at the v1 API instead of the v2 API docs.

### RESTful APIs

Just like your routes should ideally be set up in a RESTful way, so too should APIs.  These days, most APIs are RESTful, meaning the usual batch of GET/PUT/PATCH/DELETE requests will retrieve resources as expected.  The good part about setting up your application routes RESTfully is that your API will be the same way.

Working with RESTful APIs at least takes a lot of the headache out of the process since you can usually sort of guess what you should be doing, then can head over to the docs to figure out how exactly and what format you'll get the results back in.  For instance, just like you'd expect the GET request to the `/users` route in your app to display a page listing all its users, a GET request to a RESTful API for the same route should probably give you back a JSON or XML object filled with all the users (or at least some paginated sample of them).

### Oauth and Login via API

You've seen sites where their homepage lets you log in using Facebook or Twitter or LinkedIn.  After logging in with one of those third-party services you magically have a new account with them but don't need to give them a new password.

OAuth is usually behind this.  It solves the very real problem of user data privacy and access control.  The idea is that the user shouldn't need to give your awesome application their password in order for you to make requests on their behalf.  So OAuth allows Facebook to act as a sort of intermediary when dealing with the user.

This has two great use cases -- logging in the user with an external site like Facebook and making requests for or submissions of data on the User's behalf.

In the first case, you never actually discover the user's Facebook password.  They get redirected to Facebook's website to sign in, where they authorize you to use some of their data (which you'll have to configure when you set up this process).  Facebook then calls you back (by sending a request to a URL of your choosing with the proper data) and gives you a special access token for that user.  You can then use that to get any additional data that the user has authorized you to access (like their name and email address).  Now you can create a new user in your database with that data and everyone's relatively happy.

From the user's perspective, they only need to remember their Facebook password to log into your site so it's easy for them.  They also don't need to trust you with their password.  As long as they trust Facebook, they can use your site.  Also, if your site is doing bad things with their data (like when SocialCam spammed the hell out of everyone's Facebook timeline for a while), they can tell Facebook to stop allowing you to use their data and Facebook will turn off access for the token they gave you.  

From Facebook's perspective, they retain majority ownership of the user and nestle deeper into everyone's lives (for better or for worse).

Once you have the user token, you are allowed to make requests or submissions based on whatever permissions Facebook (and the user) authorized you to.  That could involve asking who their friends are, posting on their timeline, or "liking" something.  You just need to include the token as a part of your authentication process for the request.

#### Restrictions

Every site, in addition to rate limiting their API, will have terms of use.  This usually covers what you're allowed to do with the data you gather.  For instance, they probably aren't going to allow you to store a whole bunch of their data in your own database (harvesting).  They also probably won't allow you to do anything SPAMmy or which will hurt their user's experience.  Common sense should be your initial guide, but consult the TOU documentation for specifics.  Basically, if you'll be hurting their user's experience or taking their precious data, you can't do it.

It should be noted that any time you develop using someone else's API, you're putting yourself at their mercy.  If you're using it to the point where you pay for data, they'll love you.  If you get too successful and become competitive with them, they've got you by the neck and will cut you off or demand exorbitant fees.  Just be cognizant of those risks.

#### OAuth 2.0 Basics

OAuth 2.0 is actually pretty complicated, so I'll just cover the basic process.  You don't really need to care how exactly it works behind the scenes until you start really developing with it or trying to create your own API that uses it.  You **will** need to understand the steps involved in the user experience because, well, the user is the reason you're building your application.

Basically (still using Facebook as an example):

1. User tries to access a page on your app and you ask the user to login
2. User chooses the "Login With Facebook" option
3. User is redirected to a Facebook page asking them to review the permissions you are asking for and telling them to sign in.  The URI will contain parameters that tell Facebook who your application is and possibly which URI they should submit their response to (or maybe you specified this as a part of your API registration process with them).
4. User decides you seem like a fun application so he'll allow you to see his email address and post to his timeline.  He signs in to his Facebook account.  Facebook creates an authorization code and sends it back to your application's callback URI.
5. The user waits while your application takes that authorization code and uses it to ask Facebook for the real good stuff.  Facebook makes sure your application is the same one the user authorized, then POSTs back to you a unique authentication token for the user (which likely expires in 90 days) and any data you asked for up front (like email address).
5. You store the user's unique token in your database and use it, along with your application key(s), to make any subsequent requests on the user's behalf.

See [this brief overview of OAuth 2.0](http://tutorials.jenkov.com/oauth2/overview.html) for an overview.  Then check out [this more substantive explanation from tutsplus.com](http://net.tutsplus.com/tutorials/oauth-2-0-the-good-the-bad-the-ugly/).

#### Implementing OAuth 2.0 in Rails -- Use Omniauth!

This sounds horribly complicated! Someone must have made a gem for it...

Luckily someone has.  Many someones, actually.  There is a generic OAuth gem called `omniauth` (docs available [on Github](https://github.com/intridea/omniauth)) and then a separate gem which provides a specific authentication strategy for every major API (see the list [HERE](https://github.com/intridea/omniauth/wiki/List-of-Strategies)).  Once you've gone through things with one of them, you'll become comfortable with all of them.

I'll leave it to the projects to walk through using Omniauth since it's much easier to learn by doing than reading a bunch of bullet points.

### SDKs

In addition to or instead of API access, many companies provide SDKs (software development kits).  Usually these are Javascript libraries that contain all the code necessary to access their API.  This can be useful because you're then able to access the API with simple Javascript methods instead of doing backflips on your own backend.  It comes with the downside, however, of expanding your code base and forcing you to use their conventions for everything.  

We won't cover SDKs explicitly in this course but they should be well within reach to pick up by reading the documentation.

### Assignment

<div class="lesson-content__panel" markdown="1">
  1. Watch [this Railscast on using Omniauth to allow Twitter Signin](http://railscasts.com/episodes/241-simple-omniauth-revised).
  2. Read through the [Omniauth documentation](https://github.com/intridea/omniauth)
  3. Pick an API that you really might like to interface with or a web product you use almost every day (e.g. Google, Facebook, Instagram...).  Google for its docs, e.g. with "instagram api documentation", and have a look at them.  Some docs are better than others, but they will be your source for understanding which methods you can call, what they will return, how to register your application to get an API key, and more useful tidbits.
</div>

### Conclusion

APIs are fundamental to making rich web applications and they're also a lot of fun -- it makes your app feel a lot more "real" when you're able to let your users log in using Facebook or if you can display information from different sources across the web.  If you're building a startup, it improves the user experience enough that you'll likely see an uptick in conversion rates.    

Working with external APIs can be incredibly rewarding because you're able to leverage functionality that others have spent a lot of time perfecting but also incredibly frustrating because they're all different and you have to rely on gems which are doing things behind the scenes that you're not entirely sure of.  Over time, you'll start to see a lot of similarities between APIs and the procedure for working with them will feel more and more comfortable.  To help get you there, the next project will have you working with an API and your final project will have you implementing signin via API as well.  

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* See [This SO Post on interfacing with third-party APIs](http://stackoverflow.com/questions/6228870/interfacing-with-a-third-party-api-in-rails-opeing-urls-and-parsing-xml-json) for tips.
* [RailsConf 2016 - From Zero to API Hero: Consuming APIs like a Pro by Cecy Correa](https://www.youtube.com/watch?v=Af5HDgvGuXk)
