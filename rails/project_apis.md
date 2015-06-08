# Projects: Building and Using APIs
<!-- *Estimated Time: 4-8 hrs* -->

*Don't forget to use Git to save your projects!*

## Warmup: Exploring the Flickr API

In this warmup, you'll get a chance to poke around with an existing API from Flickr.  You'll need to read the documentation to understand which calls to make but they have a nice API explorer tool which submits API calls on your behalf.

### Your Task

1. Head over to the [Flickr API Documentation Page](http://www.flickr.com/services/api/).  You can just google `XYZ API docs` to locate these pages, which is usually much faster and easier than trying to find them by navigating the websites themselves.
2. Look around at the different methods available.  They have a couple of different request formats, but check out the RESTful API format by clicking on the link on the left under "Request Formats" called [Rest](http://www.flickr.com/services/api/request.rest.html).
3. This shows you the format that a typical API call would take -- you will make your request to the endpoint at `http://api.flickr.com/services/rest/` and include any required data in the GET query string or the POST body.
4. Look around at the various methods.  How would you upload a photo?  How about getting your contacts list?  Lots of these methods will require you to authenticate your application or user account first.
5. Check out the [Search method docs](http://www.flickr.com/services/api/flickr.photos.search.html).  This request doesn't require you to authenticate, just provide an API key (which you would get by registering as a developer on their platform).  Browse through all the arguments that can be used.
6. If you go to the bottom of the Search docs, you'll see a link to the [Search API Explorer](http://www.flickr.com/services/api/explore/flickr.photos.search).  This tool lets you actually execute requests using Flickr's API key for illustrative purposes.  You just enter the options you want and it will make the request for you.  Try entering "puppies" under the "tags" argument, then scroll to the bottom.  Change the response "Output" dropdown to JSON then click "Call Method".
7. When the page refreshes, you'll see your results down at the bottom.  You should see a big list of photo objects (after some meta data) that were returned by your search.  They look like:

    ```language-bash
        { "id": "11357337313", "owner": "84645040@N00", "secret": "6dd795c9c6", "server": "3805", "farm": 4, "title": "Gavin-Feb2013-0127", "ispublic": 1, "isfriend": 0, "isfamily": 0 },
    ```

    More interestingly, you can see the URL they used to make the request below that.  I've broken it apart here to show the parameters more clearly:

    ```language-bash
        http://api.flickr.com/services/rest/
          ?method=flickr.photos.search
          &api_key=e0eb58bf4b3e29b253e86d6092e69dee
          &tags=puppies
          &format=json
          &nojsoncallback=1
          &api_sig=200efb63cb01a3d141fff12585e1e20a
    ```

1. The URL contains the REST endpoint we looked at before, along with our search query and some other options like the API key and format.  If you copy and paste that into your browser, you'll see the same batch of output.
2. If you look back on the [main API docs page](http://www.flickr.com/services/api/) in the "Read these first" box, there's a link that says [URLs](http://www.flickr.com/services/api/misc.urls.html).  Follow that link.
3. Flickr's API requires two steps to actually display a photo -- you need to get a photo's meta information (which we just received in our search results) and then you need to piece it together into a URL that Flickr can understand to actually retrieve the photo.  The format they suggest is:

        http://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg

    We can plug in values from the previously retrieved photo to display a photo:

        http://farm4.staticflickr.com/3805/11357337313_6dd795c9c6.jpg

    Which looks a lot like:

    <img src="http://farm4.staticflickr.com/3805/11357337313_6dd795c9c6.jpg">

    We could also add in additional parameters like `size` on the end.

2. Tada! Every API is different and you've got to read through their documentation to understand the basic format of using it.  Sometimes it can be helpful to search for a [YouTube](http://www.youtube.com) or [NetTuts](http://code.tutsplus.com) video with a quick overview as well.

## Project 1: Building a Simple Kittens API

This is a fast and straightforward project where you'll set up a Rails app to be a data-producing API... which is just a fancy way of saying that all your controller methods will render data instead of HTML.  Consider this a drill in quickly building a pure vanilla RESTful resource.  We won't be working with an external API until the second project.

### Your Task

#### HTML

We'll start by building our Kitten application to work normally in the browser with HTML.

1. Set up a new Rails application (`odin-kittens`) and Git repo
2. Update the README to describe the application and link back to this project.
3. Build a Kitten model with attributes of `:name`, `:age`, `:cuteness`, and `:softness`.
4. Build a KittensController and `:kittens` routes for all 7 RESTful actions.
3. Remove the default `app/public/index.html` file and set your default route to `KittensController#index`
5. Fill out each of your controller actions and their corresponding views to display a very basic HTML page -- `#index` should just list all Kittens, `#show` should display a single Kitten, `#new` should render a simple Kitten creation form, `#edit` should use the same form (which should be a partial used by both the New and Edit views) to Edit the Kitten, `#create` and `#update` should do their jobs.
6. Make a `delete` link on the Kitten's Show and Edit pages, as well as next to each Kitten listed in the Index page.
7. Implement a simple display of the `flash` hash (like you did in the tutorial) which congratulates you on adding or editing or deleting kittens and makes fun of you for errors in your form.
7. Test out your Kitten creation machine to make sure all your controller actions are running properly.

#### JSON API

Now it's time to make the Kittens resource available via API.

1. Open a new command line tab and fire up IRB.  `> require 'rest_client'` (you may need to `$ gem install rest_client` if you haven't already).  Test it out by making a request to your application using `> response = RestClient.get("http://localhost:3000/kittens")`
2. You should get a sloppy mess of HTML.  If you check out your server output, it's probably processing as XML, e.g. `Processing by KittensController#index as XML`
3. Try asking specifically for a JSON response by adding the option `:accept => :json`, e.g. `RestClient.get("http://localhost:3000/kittens", :accept => :json)`.  It should throw an error.
3. Now modify your KittenController's `#index` method to `#respond_to` JSON and render the proper variables.
4. Test it out by making sure your RestClient calls return the proper JSON strings.
5. Do the same for your `#show` method, which will require you to provide an ID when making your request.  Your CSRF protection will prevent you from creating, updating or deleting kittens via the API, so it's not necessary to implement those.

This project may seem simple, but now you've got a website that is both a normal HTML-producing back end AND an API that can be used to pull data from it.  You could use Javascript calls from the front end to dynamically refresh your data now or even to load the whole page in the first place.  Or maybe you'll be hooking up a Kittens app to your iPhone and need a back end.  It doesn't matter, since now you've got a RESTful API.

### Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* [sirramongabriel's solution](https://github.com/sirramongabriel/odin-kittens)
* [jamie's solution](https://github.com/Jberczel/odin-projects/tree/master/odin-kittens)
* [Donald's solution](https://github.com/donaldali/odin-rails/tree/master/odin-kittens)
* [Adrian Badarau's solution](https://github.com/adrianbadarau/Kittens-API)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project3_Kittens/kittens)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/tree/master/Chapter_04-Advanced_Rails/kittens-api)
* [Vidul's solution](https://github.com/viparthasarathy/odin-kittens)
* [Jason Matthews' solution](https://github.com/fo0man/odin-kittens)
* [Dominik Stodolny's solution](https://github.com/dstodolny/odin-kittens)
* [Kevin Mulhern's solution](https://github.com/KevinMulhern/odin-kittens)
* Add your solution above this line!


## Project 2: Using a Third Party API

Remember way back in the warm-up when you played with the Flickr API?  Now it's time for you to actually use it.  Huzzah!  You'll create a simple photo widget that allows you to display photos from your Flickr feed (or someone else's).  We'll rely on a tutorial for much of the heavy lifting but the principles of what you do here will be repeatable for use with other APIs.

### Your Task

1. Go back to the [Flickr API Docs](http://www.flickr.com/services/api/) and click [Create an App](http://www.flickr.com/services/apps/create/) at the top.
2. Follow the steps for getting your API key.  You'll have to sign in or sign up for Yahoo (someone has to these days) and give them some basic information about your app.  Select "Apply for a non-commercial key" and let them know how awesome your photo feed app will be.  You'll automatically get a key generated for you, in addition to a secret key.  Copy both of these somewhere you can get to them later.
3. Use the [idGettr](http://idgettr.com/) website to look up your ID by pasting in your flickr username in the example URL, e.g. `http://www.flickr.com/photos/eriktrautman/`.  You'll need that later for some of the API methods.
3. Upload a few photos to your photostream!
4. Follow the tutorial listed at [pixellatedvisions.com](http://www.pixellatedvisions.com/2009/04/06/integrating-flickr-into-your-rails-website) for building a Flickr sidebar.  You've already completed a couple of the steps.  The tutorial is old but should still work for you.  It uses the `flickr_fu` gem, which no longer works with the Flickr API, but there are other options out there (like [Flickraw](http://hanklords.github.io/flickraw/ "Flickraw")).  You'll find a gem for pretty much every API out there.  They will all require you to include your API keys and secret keys somehow, in this case by using the `config/flickr.yml` file.
5. One note is that it's not good practice to have your secret key hard coded into your app because then it's hardly a secret, especially if you're pushing to Github.  A better practice is to store the key in an [environment variable](http://railsapps.github.io/rails-environment-variables.html) instead and/or use a gem like [`figaro` (see docs)](https://github.com/laserlemon/figaro).  Environment variables allow you to push your key to your app directly from the command line when it fires up.  Figaro operates under the same principle, though it helps you out by allowing you to store the keys in an actual file that just doesn't get committed with the rest of your code.  Use one of these techniques unless you're a cowboy.  They are well described in [Daniel Kehoe's RailsApps article](http://railsapps.github.io/rails-environment-variables.html).
5. Build a simple StaticPagesController to display a home page with a simple form.  The form should just be a single text field which takes the ID for a Flickr user.  Once the form is submitted, the page should refresh and display the photos from that user.
6. Modify the image feed from the tutorial's sidebar to display in the main page body instead.  This is to test how much you learned vs. copy-pasted!
7. Ask for your friends' flickr IDs or find random photofeeds on the web.  View them in your app and react appropriately.

### Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* [Donald's solution](https://github.com/donaldali/odin-rails/tree/master/odin-flickr)
* [Adrian Badarau's solution](https://github.com/adrianbadarau/rails-flickr-api-test-app)
* [Jack's solution](https://github.com/jnguyen85/flickr_search)
* [Dominik Stodolny's solution](https://github.com/dstodolny/odin-flickr)
* [Alex's solution](https://github.com/alexgh123/odin-api-practice) | [View in browser](https://radiant-bastion-6163.herokuapp.com)
* [Kevin Mulhern's solution](https://github.com/KevinMulhern/odin-flickr-api-app)
* Add your solution above this line!


## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*
* 
