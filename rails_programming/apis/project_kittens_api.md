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
2. You should get a sloppy mess of HTML.  If you check out your server output, it's probably processing as XML, e.g. `Processing by KittensController#index as XML`
3. Try asking specifically for a JSON response by adding the option `:accept => :json`, e.g. `RestClient.get("http://localhost:3000/kittens", :accept => :json)`.  It should throw an error.
4. Now modify your KittenController's `#index` method to `#respond_to` JSON and render the proper variables.
5. Test it out by making sure your RestClient calls return the proper JSON strings, e.g. `$ r = RestClient.get("http://localhost:3000/kittens", :accept => :json)`, `$ puts r.body`.
6. Do the same for your `#show` method, which will require you to provide an ID when making your request.  Your CSRF protection will prevent you from creating, updating or deleting kittens via the API, so it's not necessary to implement those.

This project may seem simple, but now you've got a website that is both a normal HTML-producing back end AND an API that can be used to pull data from it.  You could use JavaScript calls from the front end to dynamically refresh your data now or even to load the whole page in the first place.  Or maybe you'll be hooking up a Kittens app to your iPhone and need a back end.  It doesn't matter, since now you've got a RESTful API.

</div>

### Student Solutions
Send us your solution so we can show others! Submit a link to the GitHub repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's GitHub handle somewhere in the description if they would like attribution.

<details markdown="block">
  <summary> Show Student Solutions </summary>

* Add your solution below this line!
* [Darren's Solution](https://github.com/DarrenLo0530/rails-mini-projects/tree/master/kittens)
* [Axel Lopez's Solution](https://github.com/lopezaxel/odin-kittens)
* [Saul-Good-Homie's Solution](https://github.com/Saul-Good-Homie/odin-kittens)
* [JvPelai's Solution](https://github.com/JvPelai/odin_kittens)
* [irlgabriel's Solution](https://github.com/irlgabriel/kittens-odin)
* [pudu87's Solution](https://github.com/pudu87/odin-kittens)
* [Christian's Solution](https://github.com/rueeazy/odin_kittens)
* [leetie's Solution](https://github.com/leetie/api-project)
* [Olugbade Olalekan's Solution](https://github.com/gbadesimple/project-odin-kittens)
* [Lucas Bide's Solution](https://github.com/Lucas-Bide/odin-kittens)
* [Run After's Solution](https://github.com/run-after/odin-kittens)
* [Jose Salvador's Solution](https://github.com/Jsalvadorpp/odin-kittens)
* [Ovsjah Schweinefresser's Solution](https://github.com/Ovsjah/odin_kittens) - [View in Browser](https://ovsjazz-odin-kittens.herokuapp.com/)
* [robomonk's Solution](https://github.com/robo-monk/odin-kittens)
* [fossegrim's Solution](https://github.com/olav35/odin-kittens)
* [CodingCop's Solution](https://github.com/cleve703/odin-kittens)
* [Ian's Solution](https://github.com/IanMKesler/odin-kittens)
* [Braxton Lemmon's Solution](https://github.com/braxtonlemmon/odin-kittens)
* [Helmi's Solution](https://github.com/helmihidzir/odin-kittens)
* [Kevin Vuong's Solution](https://github.com/fffear/odin-kittens)
* [Learnsometing's Solution](https://github.com/learnsometing/rails-odin-apis_users)
* [Simon Tharby's Solution](https://github.com/jinjagit/kittens-api)
* [Jason McKee's Solution](https://github.com/jttmckee/odin-kittens)
* [Chibuzor's Solution](https://github.com/uzorjchibuzor/odin-kitten)
* [Javier Machin's Solution](https://github.com/Javier-Machin/odin-lizards)
* [nmac's Solution](https://github.com/nmacawile/odin-kittens)
* [brxck's Solution](https://github.com/brxck/kittens-api)
* [Jmooree30's Solution](https://github.com/jmooree30/odin-kittens.git)
* [theghall's Solutions](https://github.com/theghall/odin-kittens.git)
* [Clayton Sweeten's Solution](https://github.com/cjsweeten101/odin-kittens)
* [Jonathan Yiv's Solution](https://github.com/JonathanYiv/odin-kittens)
* [mindovermiles262's Solution](https://github.com/mindovermiles262/odin-kittens)
* [holdercp's Solution](https://github.com/holdercp/odin-kittens)
* [Joshua Wootonn's Solution](https://github.com/jose56wonton/kittens)
* [jfonz412's Solution](https://github.com/jfonz412/odin-kittens)
* [Austin's Solution ](https://github.com/CouchofTomato/odin-kittens)
* [Rhys B.'s Solution ](https://github.com/105ron/odin_kittens)
* [sirramongabriel's Solution](https://github.com/sirramongabriel/odin-kittens)
* [jamie's Solution](https://github.com/Jberczel/odin-projects/tree/master/odin-kittens)
* [Donald's Solution](https://github.com/donaldali/odin-rails/tree/master/odin-kittens)
* [Adrian Badarau's Solution](https://github.com/adrianbadarau/Kittens-API)
* [Marina Sergeyeva's Solution](https://github.com/imousterian/OdinProject/tree/master/Project3_Kittens/kittens)
* [Kate McFaul's Solution](https://github.com/craftykate/odin-project/tree/master/Chapter_04-Advanced_Rails/kittens-api)
* [Vidul's Solution](https://github.com/viparthasarathy/odin-kittens)
* [Jason Matthews' Solution](https://github.com/fo0man/odin-kittens)
* [Dominik Stodolny's Solution](https://github.com/dstodolny/odin-kittens)
* [Kevin Mulhern's Solution](https://github.com/KevinMulhern/odin-kittens)
* [AtActionParks's Solution](https://github.com/AtActionPark/odin_kittens)
* [Hutton Brandon's Solution](https://github.com/Hutbytheton/odin-kittens)
* [Jeremy Mauzy's Solution](https://github.com/apositivejam/the_odin_project/tree/master/odin-kittens)
* [dchen71's Solution](https://github.com/dchen71/odin-kittens)
* [Matias Pan's Solution](https://github.com/kriox26/odin-kittens)
* [Tomislav Mikulin's Solution](https://github.com/MrKindle85/odin-kittens)
* [Florian Mainguy's Solution](https://github.com/florianmainguy/theodinproject/tree/master/rails/odin-kittens)
* [lynchd2's Solution](https://github.com/lynchd2/TOP-ruby-on-rails/tree/master/odin-photo-feeder)
* [Radi Totev's Solution](https://github.com/raditotev/odin-kittens)
* [Luke Walker's Solution](https://github.com/ubershibs/rails_course/tree/master/odin-kittens)
* [srashidi's Solution](https://github.com/srashidi/APIs/tree/master/odin-kittens)
* [Scott Bobbitt's Solution](https://github.com/sco-bo/kitten_api)
* [James Brooks's Solution](https://github.com/jhbrooks/kittens-api)
* [Miguel Herrera's Solution](https://github.com/migueloherrera/odin-kittens)
* [Sander Schepens's Solution](https://github.com/schepens83/theodinproject.com/tree/master/rails/project11--odin-kittens/odin-kittens)
* [Top's Solution](https://github.com/TopOneOfTopOne/kittens-api) - [View in Browser](https://teseter.herokuapp.com/)
* [Matt Velez's Solution](https://github.com/Timecrash/rails-projects/tree/master/odin-kittens)
* [Fabricio Carrara's Solution](https://github.com/fcarrara/odin-kittens)
* [David Chapman's Solution](https://github.com/davidchappy/odin_training_projects/tree/master/odin-kittens-api)
* [Mayowa Pitan's Solution](https://github.com/andela-mpitan/odin-kittens)
* [Shala Qweghen's Solution](https://github.com/ShalaQweghen/odin-kittens)
* [Frank V's Solution](https://github.com/fv42wid/kittens)
* [Amrr Bakry's Solution (with API versioning)](https://github.com/Amrrbakry/rails_the_odin_project/tree/master/odin_kittens) - [View in Browser](https://still-woodland-31813.herokuapp.com/)
* [Dylan's Solution with comprehensive controller testing](https://github.com/resputin/the_odin_project/tree/master/Rails/odin-kittens)
* [DV's Solution](https://github.com/dvislearning/odin-kittens)
* [Sophia Wu's Solution](https://github.com/SophiaLWu/kittens-api)
* [Daniel Aguilar's Solution](https://github.com/danaguilar/odin-kittens)
* [Francisco Carlos's Solution](https://github.com/fcarlosdev/the_odin_project/tree/master/odin-kittens)
* [Punnadittr's Solution](https://github.com/punnadittr/odin-kittens)
* [JZaitz's Solution](https://github.com/JZaitz/Kittens-API)
* [Uy Bình's Solution](https://github.com/uybinh/odin-kittens) - [View in Browser](https://odin-kitten-summer-hot.herokuapp.com/api/kittens/)
* [Areeba's Solution](https://github.com/AREEBAISHTIAQ/odin-kittens)
* [Agon's Solution](https://github.com/AgonIdrizi/kitten)
* [Malaika's Solution](https://github.com/malaikaMI/odin-kittens)
* [bchalman's Solution](https://github.com/bchalman/odin-kittens)
* [Brendaneus' Solution](https://theodinprojects.live/courses/ruby-on-rails/projects/kittens-api)
* [vanny96's Solution](https://github.com/vanny96/odin-kittens)
* [JamCry's Solution](https://github.com/jamcry/odin-kittens-api)
* [Jamesredux's Solution](https://github.com/Jamesredux/odin-kittens)
* [Rey van den Berg's Solution](https://github.com/Rey810/odin-kittens-api)
* [Timework's Solution](https://github.com/Timework/odin-kittens)
* [Sanyogita's Solution](https://github.com/SanyogitaPandit/ruby_on_rails/tree/master/odin-kittens)
* [Bendee's Solution](https://github.com/bendee48/rails-kittens)
* [Christian Paez's Solution](https://github.com/christian1894/odin-kittens)
</details>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.
