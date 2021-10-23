### Warmup: Exploring the Flickr API

In this warmup, you'll get a chance to poke around with an existing API from Flickr.  You'll need to read the documentation to understand which calls to make but they have a nice API explorer tool which submits API calls on your behalf.

### Your Task

<div class="lesson-content__panel" markdown="1">
1. Head over to the [Flickr API Documentation Page](http://www.flickr.com/services/api/).  You can just google `XYZ API docs` to locate these pages, which is usually much faster and easier than trying to find them by navigating the websites themselves.
2. Look around at the different methods available.  They have a couple of different request formats, but check out the RESTful API format by clicking on the link on the left under "Request Formats" called [REST](http://www.flickr.com/services/api/request.rest.html).
3. This shows you the format that a typical API call would take -- you will make your request to the endpoint at `http://api.flickr.com/services/rest/` and include any required data in the GET query string or the POST body.
4. Look around at the various methods.  How would you upload a photo?  How about getting your contacts list?  Lots of these methods will require you to authenticate your application or user account first.
5. Check out the [Search method docs](http://www.flickr.com/services/api/flickr.photos.search.html).  This request doesn't require you to authenticate, just provide an API key (which you would get by registering as a developer on their platform).  Browse through all the arguments that can be used.
6. If you go to the bottom of the Search docs, you'll see a link to the [Search API Explorer](http://www.flickr.com/services/api/explore/flickr.photos.search).  This tool lets you actually execute requests using Flickr's API key for illustrative purposes.  You just enter the options you want and it will make the request for you.  Try entering "puppies" under the "tags" argument, then scroll to the bottom.  Change the response "Output" dropdown to JSON then click "Call Method".
7. When the page refreshes, you'll see your results down at the bottom.  You should see a big list of photo objects (after some meta data) that were returned by your search.  They look like:

   ~~~json
   { "id": "11357337313", "owner": "84645040@N00", "secret": "6dd795c9c6", "server": "3805", "farm": 4, "title": "Gavin-Feb2013-0127", "ispublic": 1, "isfriend": 0, "isfamily": 0 },
   ~~~

   More interestingly, you can see the URL they used to make the request below that.  I've broken it apart here to show the parameters more clearly:

   ~~~bash
   http://api.flickr.com/services/rest/
   ?method=flickr.photos.search
   &api_key=e0eb58bf4b3e29b253e86d6092e69dee
   &tags=puppies
   &format=json
   &nojsoncallback=1
   &api_sig=200efb63cb01a3d141fff12585e1e20a
   ~~~

8. The URL contains the REST endpoint we looked at before, along with our search query and some other options like the API key and format.  If you copy and paste that into your browser, you'll see the same batch of output.
9. If you look back on the [main API docs page](http://www.flickr.com/services/api/) in the "Read these first" box, there's a link that says [URLs](http://www.flickr.com/services/api/misc.urls.html).  Follow that link.
10. Flickr's API requires two steps to actually display a photo -- you need to get a photo's meta information (which we just received in our search results) and then you need to piece it together into a URL that Flickr can understand to actually retrieve the photo.  The format they suggest is:

    `http://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg`

    We can plug in values from the previously retrieved photo to display a photo:

    `http://farm4.staticflickr.com/3805/11357337313_6dd795c9c6.jpg`

    Which looks like:

    <img src="http://farm4.staticflickr.com/3805/11357337313_6dd795c9c6.jpg">

    We could also add in additional parameters like `size` on the end.

11. Tada! Every API is different and you've got to read through their documentation to understand the basic format of using it.  Sometimes it can be helpful to search for a [YouTube](http://www.youtube.com) or [NetTuts](http://code.tutsplus.com) video with a quick overview as well.

</div>

### Building a Simple Kittens API

This is a fast and straightforward project where you'll set up a Rails app to be a data-producing API... which is just a fancy way of saying that all your controller methods will render data instead of HTML.  Consider this a drill in quickly building a pure vanilla RESTful resource.  We won't be working with an external API until the next project.

### Your Task

<div class="lesson-content__panel" markdown="1">

### HTML

We'll start by building our Kitten application to work normally in the browser with HTML.

1. Set up a new Rails application (`odin-kittens`) and Git repo.
2. Update the README to describe the application and link back to this project.
3. Build a Kitten model with attributes of `:name`, `:age`, `:cuteness`, and `:softness`.
4. Build a KittensController and `:kittens` routes for all 7 RESTful actions.
3. Set your default route to `KittensController#index`.
5. Fill out each of your controller actions and their corresponding views to display a very basic HTML page -- `#index` should just list all Kittens, `#show` should display a single Kitten, `#new` should render a simple Kitten creation form, `#edit` should use the same form (which should be a partial used by both the New and Edit views) to Edit the Kitten, `#create` and `#update` should do their jobs.
6. Make a `delete` link on the Kitten's Show and Edit pages, as well as next to each Kitten listed in the Index page.
7. Implement a simple display of the `flash` hash which congratulates you on adding or editing or deleting kittens and makes fun of you for errors in your form.
8. Test out your Kitten creation machine to make sure all your controller actions are running properly.

### JSON API

Now it's time to make the Kittens resource available via API.

1. Open a new command line tab and fire up IRB.  `> require 'rest-client'` (you may need to `$ gem install rest-client` if you haven't already).  Test it out by making a request to your application using `> response = RestClient.get("http://localhost:3000/kittens")`
2. Calling `#body` or `#to_s` on the `RestClient::Response` object `response` should return a sloppy mess of HTML.  If you check out your server output, it's probably processing as \*/\* (i.e. all media types), e.g. `Processing by KittensController#index as */*`
3. Try asking specifically for a JSON response by adding the option `:accept => :json`, e.g. `RestClient.get("http://localhost:3000/kittens", :accept => :json)`.  It should throw an error.
4. Now modify your KittenController's `#index` method to `#respond_to` JSON and render the proper variables.
5. Test it out by making sure your RestClient calls return the proper JSON strings, e.g. `> r = RestClient.get("http://localhost:3000/kittens", :accept => :json)`, `> puts r.body`.
6. Do the same for your `#show` method, which will require you to provide an ID when making your request.  Your CSRF protection will prevent you from creating, updating or deleting kittens via the API, so it's not necessary to implement those.

This project may seem simple, but now you've got a website that is both a normal HTML-producing back end AND an API that can be used to pull data from it.  You could use JavaScript calls from the front end to dynamically refresh your data now or even to load the whole page in the first place.  Or maybe you'll be hooking up a Kittens app to your iPhone and need a back end.  It doesn't matter, since now you've got a RESTful API.

</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.
