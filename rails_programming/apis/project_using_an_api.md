### Introduction

Remember the warm-up in the previous project when you played with the Flickr API?  Now it's time for you to actually use it.  Huzzah!  You'll create a simple photo widget that allows you to display photos from your Flickr feed (or someone else's). We'll rely on a tutorial for much of the heavy lifting but the principles of what you do here will be repeatable for use with other APIs.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Go back to the [Flickr API Docs](http://www.flickr.com/services/api/) and click [Create an App](http://www.flickr.com/services/apps/create/) at the top.
2. Follow the steps for getting your API key.  You'll have to sign in or sign up for Flickr (someone has to these days) and give them some basic information about your app.  Select "Apply for a non-commercial key" and let them know how awesome your photo feed app will be.  You'll automatically get a key generated for you, in addition to a secret key.  Copy both of these somewhere you can get to them later.
3. While logged in, copy your Flickr ID from the browser address bar by navigating to the "You" link on the top navbar. It will look like `https://www.flickr.com/photos/yourIDhere/`. An example would be `1895558555@N03`. You'll need that later for some of the API methods.
4. Upload a few photos to your photostream!
5. Create a new Rails app and add a gem for the [Flickr API](http://lmgtfy.com/?q=flickr+api+gem). There are gems for pretty much every API out there. They will all require you to include your API keys and secret keys somehow. Look for gems that are maintained (have recent commits) and well-adopted (GitHub stars is one way to get a good gauge for how valuable a gem is). Alternatively, you can browse through [RubyGems](https://rubygems.org/) to see popular gems.
6. One note is that it's not good practice to have your secret key hard coded into your app because then it's hardly a secret, especially if you're pushing to GitHub.  A better practice is to store the key in an [environment variable](http://railsapps.github.io/rails-environment-variables.html) instead and/or use a gem like [`figaro` (see docs)](https://github.com/laserlemon/figaro).  Environment variables allow you to push your key to your app directly from the command line when it fires up.  Figaro operates under the same principle, though it helps you out by allowing you to store the keys in an actual file that just doesn't get committed with the rest of your code.  Use one of these techniques unless you're a cowboy.  They are well described in [Daniel Kehoe's RailsApps article](http://railsapps.github.io/rails-environment-variables.html).
7. Build a simple StaticPagesController to display a home page with a simple form.  The form should just be a single text field which takes the ID for a Flickr user.  Once the form is submitted, the page should refresh and display the photos from that user.
8. Ask for your friends' flickr IDs or find random photofeeds on the web.  View them in your app and react appropriately.
</div>

### Student Solutions
Send us your solution so we can show others! Submit a link to the GitHub repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's GitHub handle somewhere in the description if they would like attribution.

<details markdown="block">
  <summary> Show Student Solutions </summary>

* Add your solution below this line!
* [Darren's Solution](https://github.com/DarrenLo0530/rails-mini-projects/tree/master/photo-feed)
* [Axel Lopez's Solution](https://github.com/lopezaxel/photo-feed-app)
* [Saul-Good-Homie's Solution](https://github.com/Saul-Good-Homie/odin-flickr-API)
* [JvPelai's Solution](https://github.com/JvPelai/odin_flickr_album)
* [irlgabriel's Solution](https://github.com/irlgabriel/flickr-api-project) - [View in Browser](https://fast-beyond-84270.herokuapp.com/)
* [pudu87's Solution](https://github.com/pudu87/odin-flickr)
* [proto-dylan's Solution](https://github.com/proto-dylan/flickr-feeder)
* [Christian's Solution](https://github.com/rueeazy/odin_flickr)
* [leetie's Solution](https://github.com/leetie/flickr-api-2)
* [Olugbade Olalekan's Solution](https://github.com/gbadesimple/project_photo_stream_api)
* [Lucas Bide's Solution](https://github.com/Lucas-Bide/odin-flickr-api)
* [Run After's Solution](https://github.com/run-after/flickr-api)
* [BShowen's Solution](https://github.com/BShowen/flickr_search_api) - [Live](https://flick-r.herokuapp.com/)
* [Duarte's Solution](https://github.com/Duartemartins/odin-flickr)
* [Ovsjah Schweinefresser's Solution](https://github.com/Ovsjah/flickr_api) - [View in Browser](https://ovsjazz-flickr-api.herokuapp.com/)
* [robomonk's Solution](https://github.com/robo-monk/odin-timefreeze) - [View in browser](https://shielded-shore-35008.herokuapp.com/)
* [fossegrim's Solution](https://github.com/olav35/odin-flickr)
* [CodingCop's Solution](https://github.com/cleve703/flickr-learning)
* [Ian's Solution](https://github.com/IanMKesler/flickr-widget)
* [Helmi's Solution](https://github.com/helmihidzir/odin_flickr)
* [Kevin Vuong's Solution](https://github.com/fffear/odin_flickr)
* [Learnsometing's Solution](https://github.com/learnsometing/Rails-flickr_api)
* [Simon Tharby's Solution](https://github.com/jinjagit/flickr-api) - [View in browser](https://findr-simontharby.herokuapp.com/)
* [Jason McKee's Solution](https://github.com/jttmckee/odin-flickr.git) - [View in browser](https://immense-bayou-47624.herokuapp.com/)
* [Max Garber's Solution](https://github.com/bubblebooy/odin-flickr)
* [Javier Machin's Solution](https://github.com/Javier-Machin/Flickr-API)
* [szib's Solution](https://github.com/szib/odin-flickr) - [View in browser](https://intense-escarpment-22977.herokuapp.com/)
* [nmac's Solution](https://github.com/nmacawile/flickr-browsr) - [Heroku](https://ancient-coast-53530.herokuapp.com/?user=flickr)
* [brxck's Solution](https://github.com/brxck/flickr-viewer) - [View in browser](https://protected-sea-14480.herokuapp.com/)
* [Jmooree30's Solution](https://github.com/jmooree30/odin-api.git) - [View in browser](https://lit-bastion-68220.herokuapp.com/)
* [theghall's Solution](https://github.com/theghall/odin-flickr.git)
* [Clayton Sweeten's Solution](https://github.com/cjsweeten101/odin-flickr)
* [Jonathan Yiv's Solution](https://github.com/JonathanYiv/flickr-api)
* [mindovermiles262's Solution](https://github.com/mindovermiles262/flickr-api) - [View in browser](https://flickr-api-ad.herokuapp.com/)
* [leosoaivan's Solution](https://github.com/leosoaivan/TOP_ror_flickr) - [View in browser](https://still-spire-50621.herokuapp.com/)
* [Joshua Wootonn's Solution](https://github.com/jose56wonton/flickr_api_test)
* [holdercp's Solution](https://github.com/holdercp/flickr-feed) - [View in browser](https://stark-brook-63398.herokuapp.com/)
* [Austin's Solution](https://github.com/CouchofTomato/odin_flikr)
* [Rhys B.'s Solution ](https://github.com/105ron/flickrphotos) - [View in browser](https://calm-coast-27204.herokuapp.com)
* [Donald's Solution](https://github.com/donaldali/odin-rails/tree/master/odin-flickr)
* [Adrian Badarau's Solution](https://github.com/adrianbadarau/rails-flickr-api-test-app)
* [Jack's Solution](https://github.com/jnguyen85/flickr_search)
* [Dominik Stodolny's Solution](https://github.com/dstodolny/odin-flickr)
* [Alex's Solution](https://github.com/alexgh123/odin-api-practice) - [View in browser](https://radiant-bastion-6163.herokuapp.com)
* [Kevin Mulhern's Solution](https://github.com/KevinMulhern/odin-flickr-api-app)
* [AtActionPark's Solution - With fix for ssl error on windows](https://github.com/AtActionPark/odin_flickr_api_app)
* [Jeremy Mauzy's Solution](https://github.com/apositivejam/the_odin_project/tree/master/flickr_api)
* [Tomislav Mikulin's Solution](https://github.com/MrKindle85/odin-flickr-api)
* [Luke Walker's Solution](https://github.com/ubershibs/rails_course/tree/master/flickr-sidebar)
* [srashidi's Solution](https://github.com/srashidi/APIs/tree/master/flickr-sidebar)
* [Scott Bobbitt's Solution](https://github.com/sco-bo/flickr_widget) - [View in Browser](https://secure-refuge-22481.herokuapp.com/)
* [James Brooks's Solution](https://github.com/jhbrooks/flickr-get) - [View in browser](https://still-tor-87008.herokuapp.com/)
* [Miguel Herrera's Solution](https://github.com/migueloherrera/odin-photos)
* [Sander Schepens's Solution](https://github.com/schepens83/theodinproject.com/tree/master/rails/project11--odin-kittens/flickr-viewer)
* [Top's Solution](https://github.com/TopOneOfTopOne/flickr-api) - [View in Browser](https://flickr-apii.herokuapp.com/)
* [Matt Velez's Solution](https://github.com/Timecrash/rails-projects/tree/master/flickr-sidebar)
* [David Chapman's Solution](https://github.com/davidchappy/odin_training_projects/tree/master/flickr-api)
* [Mayowa Pitan's Solution](https://github.com/andela-mpitan/odin-kittens) - [View in Browser](http://odin-kittens.herokuapp.com/)
* [Shala Qweghen's Solution](https://github.com/ShalaQweghen/flickr-photo-finder) - [View in Browser](https://shielded-retreat-38986.herokuapp.com)
* [Dylan's Solution](https://github.com/resputin/the_odin_project/tree/master/Rails/flickr_api)
* [DV's Solution](https://github.com/dvislearning/odin-flickr) - [View in Browser](http://serene-spire-20652.herokuapp.com)
* [Sophia Wu's Solution](https://github.com/SophiaLWu/flickr-app-api) - [View in Browser](https://radiant-ravine-62439.herokuapp.com/)
* [Daniel Aguilar's Solution](https://github.com/danaguilar/Flicker-fotos)
* [Francisco Carlos's Solution](https://github.com/fcarlosdev/the_odin_project/tree/master/odin-flickr-api)
* [Punnadittr's Solution](https://github.com/punnadittr/flickr-api-app) - [View in Browser](https://young-wildwood-74188.herokuapp.com/)
* [Areeba's Solution](https://github.com/AREEBAISHTIAQ/flickr-browser)
* [Agon's Solution](https://github.com/AgonIdrizi/Flickr_photos)
* [Malaika's Solution](https://github.com/malaikaMI/flickr-browser)
* [bchalman's Solution](https://github.com/bchalman/odin-flickr-api)
* [Brendaneus' Solution](https://theodinprojects.live/courses/ruby-on-rails/projects/flickr-api)
* [Jamesredux's Solution](https://github.com/Jamesredux/flickr_app) - [View in Browser](https://sleepy-castle-29757.herokuapp.com/)
* [Timework's Solution](https://github.com/Timework/odin-flickr)
* [Bendee's Solution](https://github.com/bendee48/rails-photo-feed)
* [Christian Paez's Solution](https://github.com/christian1894/odin-flickr)
* [Clinton's Solution](https://github.com/Clinton-dev/simple-photo-widget)

</details>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.
