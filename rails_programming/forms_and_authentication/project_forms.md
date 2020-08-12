### Introduction

These projects will give you a chance to actually build some forms, both using nearly-pure HTML and then graduating to using the helper methods that Rails provides.

### Project: Bare Metal Forms and Helpers

In this project, you'll build a form the old fashioned way and then the Rails way.

### Your Task

<div class="lesson-content__panel" markdown="1">
#### Set up the Back End

You'll get good at setting up apps quickly in the coming lessons by using more or less this same series of steps (though we'll help you less and less each time):

1. Build a new rails app (called "re-former").
2. Go into the folder and create a new git repo there.  Check in and commit the initial stuff.
3. Modify your README file to say something you'll remember later, like "This is part of the Forms Project in The Odin Project's Ruby on Rails Curriculum.  Find it at [http://www.theodinproject.com](http://www.theodinproject.com)"
4. Create and migrate a User model with `:username`, `:email` and `:password`.
5. Add validations for presence to each field in the model.
6. Create the `:users` resource in your routes file so requests actually have somewhere to go.  Use the `:only` option to specify just the `:new` and `:create` actions.
7. Build a new UsersController (either manually or via the `$ rails generate controller Users` generator).
8. Write empty methods for `#new` and `#create` in your UsersController.
9. Create your `#new` view in `app/views/users/new.html.erb`.
10. Fire up a rails server in another tab.
11. Make sure everything works by visiting `http://localhost:3000/users/new` in the browser.

#### HTML Form

The first form you build will be mostly HTML (remember that stuff at all?).  Build it in your New view at `app/views/users/new.html.erb`.  The goal is to build a form that is almost identical to what you'd get by using a Rails helper so you can see how it's done behind the scenes.

1. Build a form for creating a new user.  See the [w3 docs for forms](http://www.w3schools.com/tags/tag_form.asp) if you've totally forgotten how they work.  Specify the `method` and the `action` attributes in your `<form>` tag (use `$ rake routes` to see which HTTP method and path are being expected based on the resource you created).  Include the attribute `accept-charset="UTF-8"` as well, which Rails naturally adds to its forms to specify Unicode character encoding.
2. Create the proper input tags for your user's fields (email, username and password).  Use the proper password input for "password".  Be sure to specify the `name` attribute for these inputs.  Make label tags which correspond to each field.
3. Submit your form and view the server output.  Oops, we don't have the right CSRF authenticity token (`ActionController::InvalidAuthenticityToken`) to protect against cross site scripting attacks and form hijacking. If you do not get an error, you used the wrong `method` from step 1.
4. Include your own authenticity token by adding a special hidden input and using the `#form_authenticity_token` method.  This method actually checks the session token that Rails has stored for that user (behind the scenes) and puts it into the form so it's able to verify that it's actually you submitting the form.  It might look like:

   ~~~html
   # app/views/users/new.html.erb
   <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
   ~~~

5. Submit the form again.  Great! Success!  We got a `Template is missing` error instead and that's A-OK because it means that we've successfully gotten through our blank `#create` action in the controller (and didn't specify what should happen next, which is why Rails is looking for a `app/views/users/create.html.erb` view by default).  Look at the server output above the error's stack trace.  It should include the parameters that were submitted, looking something like:

   ~~~bash
   Started POST "/users" for 127.0.0.1 at 2013-12-12 13:04:19 -0800
   Processing by UsersController#create as HTML
   Parameters: {"authenticity_token"=>"WUaJBOpLhFo3Mt2vlEmPQ93zMv53sDk6WFzZ2YJJQ0M=", "username"=>"foobar", "email"=>"foo@bar.com", "password"=>"[FILTERED]"}
   ~~~
That looks a whole lot like what you normally see when Rails does it, right?
6. Go into your UsersController and build out the `#create` action to take those parameters and create a new User from them.  If you successfully save the user, you should redirect back to the New User form (which will be blank) and if you don't, it should render the `:new` form again (but it will still have the existing information entered in it).  You should be able to use something like:

   ~~~ruby
   # app/controllers/users_controller.rb
   def create
     @user = User.new(username: params[:username], email: params[:email], password: params[:password])

     if @user.save
       redirect_to new_user_path
     else
       render :new
     end
   end
   ~~~

7. Test this out -- can you now create users with your form? If so, you should see an INSERT SQL command in the server log.
8. We're not done just yet... that looks too long and difficult to build a user with all those `params` calls.  It'd be a whole lot easier if we could just use a hash of the user's attributes so we could just say something like `User.new(user_params)`.  Let's build it... we need our form to submit a hash of attributes that will be used to create a user, just like we would with Rails' `form_for` method.  Remember, that method submits a top level `user` field which actually points to a hash of values.  This is simple to achieve, though -- just change the `name` attribute slightly.  Nest your three User fields inside the variable attribute using brackets in their names, e.g. `name="user[email]"`.
9. Resubmit.  Now your user parameters should be nested under the `"user"` key like:

   ~~~bash
   Parameters: {"authenticity_token" => "WUaJBOpLhFo3Mt2vlEmPQ93zMv53sDk6WFzZ2YJJQ0M=", "user" =>{ "username" => "foobar", "email" => "foo@bar.com", "password" => "[FILTERED]" } }
   ~~~

4. You'll get some errors because now your controller will need to change.  But recall that we're no longer allowed to just directly call `params[:user]` because that would return a hash and Rails' security features prevent us from doing that without first validating it.
5. Go into your controller and comment out the line in your `#create` action where you instantiated a `::new` User (we'll use it later).
6. Implement a private method at the bottom called `user_params` which will `permit` and `require` the proper fields (see the [Controllers Lesson](/courses/ruby-on-rails/lessons/controllers) for a refresher).
7. Add a new `::new` User line which makes use of that new whitelisting params method.
5. Submit your form now.  It should work marvelously (once you debug your typos)!

#### Railsy Forms with `#form_tag`

Now we'll start morphing our form into a full Rails form using the `#form_tag` and `#*_tag` helpers.  There's actually very little additional help that's going on and you'll find that you're mostly just renaming HTML tags into Rails tags.

1. Comment out your entire HTML form.  It may be helpful to save it for later on if you get stuck.
2. Convert your `<form>` tag to use a `#form_tag` helper and all of your inputs into the proper helper tags via `#*_tag` methods.  The good thing is that you no longer need the authentication token because Rails will insert that for you automatically. `#form_tag` is soft-depracated as stated in the current Rails Guide. You can find the older documentation [here](https://guides.rubyonrails.org/v5.2/form_helpers.html).
3. See the [Form Tag API Documentation](http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html#method-i-form_tag) for a list and usage of all the input methods you can use with `#form_tag`.
4. Test out your form.  You'll need to change your `#create` method in the controller to once again accept normal top level User attributes, so uncomment the old `User.new` line and comment out the newer one.
5. You've just finished the first step.

#### Railsy-er Forms with `#form_for`

`#form_tag` probably didn't feel that useful -- it's about the same amount of work as using `<form>`, though it does take care of the authenticity token stuff for you.  Now we'll convert that into `#form_for`, which will make use of our model objects to build the form.

1. Modify your `#new` action in the controller to instantiate a blank User object and store it in an instance variable called `@user`.
2. Comment out your `#form_tag` form in the `app/views/users/new.html.erb` view (so now you should have TWO commented out form examples).
3. Rebuild the form using `#form_for` and the `@user` from your controller.
4. Play with the `#input` method options -- add a default placeholder (like "example@example.com" for the email field), make it generate a different label than the default one (like "Your user name here"), and try starting with a value already populated.  Some of these things you may need to Google for, but check out the [`#form_for` Rails API docs](http://apidock.com/rails/ActionView/Helpers/FormHelper/form_for)
5. Test it out.  You'll need to switch your controller's `#create` method again to accept the nested `:user` hash from `params`.

#### Editing

1. Update your routes and controller to handle editing an existing user.  You'll need your controller to find a user based on the submitted `params` ID.
2. Create the Edit view at `app/views/users/edit.html.erb` and copy/paste your form from the New view.  Your HTML and `#form_tag` forms (which should still be commented out) will not work -- they will submit the form as a POST request when you need it to be a PATCH (PUT) request (remember your `$ rake routes`?).  It's an easy fix, which you should be able to see if you attempt to edit a user with the `#form_for` form (which is smart enough to know if you're trying to edit a user or creating a new one).
3. Do a "view source" on the form generated by `#form_for` in your Edit view, paying particular attention to the hidden fields at the top nested inside the `<div>`.  See it?
4. Try submitting an edit that you know will fail your validations. `#form_for` also automatically wraps your form in some formatting (e.g. a red border on the input field) if it detects errors with a given field.
5. Save this project to Git and upload to Github.

#### Extra Credit

1. Modify your form view to display a list of the error messages that are attached to your failed model object if you fail validations.  Recall the `#errors` and `#full_messages` methods.  Start by displaying them at the top and then modify

</div>

### Student Solutions
Send us your solution by editing this [file](https://github.com/TheOdinProject/curriculum/blob/master/rails_programming/forms_and_authentication/project_forms.md) so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.

<details markdown="block">
  <summary> Show Student Solutions </summary>

* Add your solution below this line!
* [Sam Eff's Solution](https://github.com/SamEff/re-former)
* [Darren's Solution](https://github.com/DarrenLo0530/rails-mini-projects/tree/master/re-former)
* [JvPelai's Solution](https://github.com/JvPelai/re-former)
* [Uduak Essien's Solution](https://github.com/acushlakoncept/Bare-Metal-Forms-and-Helpers)
* [qazaqpyn's Solution](https://github.com/qazaqpyn/re-former)
* [Ryan Lewin's Solution](https://github.com/ryan-lewin/re-former)
* [Saul-Good-Homie's Solution](https://github.com/Saul-Good-Homie/re-former)
* [irlgabriel's Solution](https://github.com/irlgabriel/re-former)
* [Christian's Solution](https://github.com/rueeazy/re-former)
* [Aulbourn's Solution](https://github.com/aulbytj/RailsReFormer/tree/feature/build) - [View in Browser](https://fierce-atoll-94165.herokuapp.com)
* [fillingthemoon's Solution](https://github.com/fillingthemoon/re-former)
* [jodokusquack's solution](https://github.com/jodokusquack/re-former)
* [Nestor's solution](https://github.com/nestor-c/Odin_Re-former)
* [Jithin's Solution](https://github.com/jithindasad/re-former)
* [Mohamed Eltayeb's Solution](https://github.com/mohamedosamaeltayeb/reformer)
* [Airi Chow's Solution](https://github.com/airi-14x/TheOdinProject-Rails/tree/master/re-former)
* [Olugbade Olalekan's Solution](https://github.com/gbadesimple/project_forms)
* [leetie's Solution](https://github.com/leetie/re-former)
* [Lucas Bide's Solution](https://github.com/Lucas-Bide/re-former)
* [Grant Cottle's Solution](https://github.com/grantmaster89/re-former)
* [Powei94's Solution](https://github.com/powei94/rails_re-former)
* [Run After's Solution](https://github.com/run-after/re-former)
* [Helmi's Solution](https://github.com/helmihidzir/re-former)
* [David Auza's and Luis Novoa's Solution](https://github.com/davidauza-engineer/Ruby-on-Rails-Re-Former)
* [Nasser Abachi's Solution](https://github.com/abachi/re-former)
* [Vedant's Solution](https://github.com/vedantshetty/Odin_Project_Code/tree/master/Ruby_On_Rails/ReFormer)
* [Ian's Solution](https://github.com/IanMKesler/re-former)
* [Rudi Boshoff's Solution](https://github.com/RudiBoshoff/re-former) - complete with index page
* [Carlos Del Real's and António's Solution](https://github.com/carloshdelreal/re-former)
* [Braxton Lemmon's Solution](https://github.com/braxtonlemmon/re-former)
* [Kevin Vuong's Solution](https://github.com/fffear/re-former)
* [Chris Wegscheid's Solution](https://github.com/cwegscheid08/re-former)
* [Simon Tharby's Solution](https://github.com/jinjagit/re-former)
* [Stefano Merazzi's Solution](https://github.com/ste001/re-former)
* [Jason McKee's Solution](https://github.com/jttmckee/re-former)
* [Ovsjah Schweinefresser's Solution](https://github.com/Ovsjah/re-former)
* [Dennis Cope's Solution](https://github.com/coped/Re-former)
* [goodjobbin85's Solution](https://github.com/goodjobbin85/odin-re-former)
* [Jeremy-D's Solution](https://github.com/Jeremy-D/re-former)
* [prw001's Solution](https://github.com/prw001/re-former)
* [Btreims's Solution](https://github.com/btreim/re-former)
* [0zra's Solution](https://github.com/0zra/re-form)
* [Javier Machin's Solution](https://github.com/Javier-Machin/re-former)
* [theghall's Solution](https://github.com/theghall/odin-re-former.git)
* [Jonathan Yiv's Solution](https://github.com/JonathanYiv/re-former)
* [Clayton Sweeten's Solution](https://github.com/cjsweeten101/re-former)
* [justinckim3's Solution](https://github.com/justinckim3/re-former)
* [Nikolay Dyulgerov's Solution](https://github.com/NicolayD/re-former)
* [mindovermiles262's Solution](https://github.com/mindovermiles262/re-former)
* [holdercp's Solution](https://github.com/holdercp/re-former)
* [jfonz412's Solution](https://github.com/jfonz412/re-former)
* [nmac's Solution](https://github.com/nmacawile/re-former)
* [Adong520's Solution](https://github.com/Adong520/reformer)
* [ToTenMilan's Solution](https://github.com/ToTenMilan/the_odin_project/tree/master/rails/forms/re-former)
* [Orlando's Solution](https://github.com/orlandodan14/Ruby-on-Rails/tree/master/Re-former)
* [leosoaivan's Solution](https://github.com/leosoaivan/TOP_reformer/tree/master)
* [Austin's Solution](https://github.com/CouchofTomato/reformer)
* [Jib's Solution](https://github.com/NuclearMachine/odin_rails/tree/master/re-former)
* [spierer's Solution](https://github.com/spierer/odin-forms)
* [Jamie's Solution](https://github.com/Jberczel/odin-projects/tree/master/re-former) - [walkthrough](http://jberczel.github.io/forms-walkthrough/)
* [Afshin M's Solution](https://github.com/afshinator/re-former)
* [Marina Sergeyeva's Solution](https://github.com/imousterian/OdinProject/tree/master/Project3_Forms/re-former)
* [Donald's Solution](https://github.com/donaldali/odin-rails/tree/master/re-former)
* [Vincent's Solution](https://github.com/wingyu/Practice_forms)
* [Tommy Noe's Solution](https://github.com/thomasjnoe/re-former)
* [Kate McFaul's Solution](https://github.com/craftykate/odin-project/tree/master/Chapter_04-Advanced_Rails/forms)
* [Nikola Čvorović's Solution](https://github.com/cvorak/re-former)
* [Jason Matthews' Solution](https://github.com/fo0man/re-former)
* [Sasikala's Solution](https://github.com/Sasikala-Ravichandran/re-former)
* [Dominik Stodolny's Solution](https://github.com/dstodolny/re-former)
* [Julian Feliciano's Solution](https://github.com/JulsFelic/re-former)
* [Trump's Solution](https://github.com/trump812/OdinProject/tree/master/Ruby_on_Rails/re-former)
* [Lara Finnegan's Solution](https://github.com/lcf0285/re-former)
* [Kevin Mulhern's Solution](https://github.com/KevinMulhern/re-former)
* [Eduardo Frias' Solution](https://github.com/feek1g/theodinproject/tree/master/RubyOnRails/re-former)
* [Frank Peelen's Solution](https://github.com/FrankPeelen/re-former)
* [Raycotek's Solution](https://github.com/Raycotek/Re-Former)
* [dchen71's Solution](https://github.com/dchen71/re-former)
* [Matias Pan's Solution](https://github.com/kriox26/re-former)
* [Tomislav Mikulin's Solution](https://github.com/MrKindle85/re-former)
* [Alex Chen's Solution](https://github.com/Chenzilla/re-former)
* [Dan Hoying's Solution](https://github.com/danhoying/re_former)
* [Hassan Mahmoud's Solution](https://github.com/HassanTC/re-former)
* [Aviv Levinsky's Solution](https://github.com/pugsiman/re-former)
* [Florian Mainguy's Solution](https://github.com/florianmainguy/theodinproject/tree/master/rails/re-former)
* [Alex Tsiras' Solution](https://github.com/arialblack14/re-former)
* [cdouglass's Solution](https://github.com/cdouglass/odin-project-exercises/tree/master/rails/re-former)
* [Radi Totev's Solution](https://github.com/raditotev/re-former)
* [srashidi's Solution](https://github.com/srashidi/Forms/tree/master/re-former)
* [Luke Walker's Solution](https://github.com/ubershibs/rails_course/tree/master/re-former)
* [Scott Bobbitt's Solution](https://github.com/sco-bo/re-former)
* [Matt Velez's Solution](https://github.com/Timecrash/rails-projects/tree/master/re-former)
* [Max Gallant's Solution](https://github.com/mcgalcode/re-former)
* [Miguel Herrera's Solution](https://github.com/migueloherrera/re-former)
* [James Brooks's Solution](https://github.com/jhbrooks/re-former)
* [Akshay Bharwani's Solution](https://github.com/akshaybharwani/re-former)
* [Sander Schepens's Solution](https://github.com/schepens83/theodinproject.com/tree/master/rails/project7--bare-metal-forms-and-helpers/re-former)
* [Arthur Vieira's Solution](https://github.com/arthur-vieira/re-former)
* [Fabricio Carrara's Solution](https://github.com/fcarrara/re-former)
* [Deepak's Solution](https://github.com/Deepak5050/re-former-v2.git)
* [Earth35's Solution](https://github.com/Earth35/re-former)
* [Shala Qweghen's Solution](https://github.com/ShalaQweghen/project_forms)
* [Jiazhi Guo's Solution](https://github.com/jerrykuo7727/re-former)
* [Amrr Bakry's Solution](https://github.com/Amrrbakry/rails_the_odin_project/tree/master/re-former)
* [Dylan's Solution](https://github.com/resputin/the_odin_project/tree/master/Rails/re-former)
* [Jakub Peikert's Solution](https://github.com/JPeikert/odin_project/tree/master/rails/forms/re-former)
* [Joe Himes's Solution](https://github.com/deedle42/re-former.git)
* [DV's Solution](https://github.com/dvislearning/re-former)
* [Devon's Solution](https://github.com/defitjo/re-former)
* [Mateusz Staszczyk's Solution](https://github.com/sleaz0id/re-former)
* [Dckwong's Solution](https://github.com/dckwong/re-former)
* [at0micr3d's Solution](https://github.com/at0micr3d/re-former)
* [Niño Mollaneda's Solution](https://github.com/ninoM/re-former)
* [Samuel Langenfeld's Solution](https://github.com/SamuelLangenfeld/re-former)
* [Tom Westerhout's Solution](https://github.com/TomWesterhout/reformer)
* [Luján Fernaud's Solution](https://github.com/lujanfernaud/rails-re-former)
* [Pat's Solution](https://github.com/Pat878/re-former)
* [Francisco's Solution](https://github.com/fcarlosdev/the_odin_project/tree/master/re-former)
* [Bridget Nyirongo's Solution](https://github.com/Bridget12/re-former)
* [Agon's Solution](https://github.com/AgonIdrizi/RailsForms)
* [Areeba's Solution](https://github.com/AREEBAISHTIAQ/re-former/tree/master/files)
* [Jamesredux's Solution](https://github.com/Jamesredux/re-former)
* [ParamagicDev's Solution](https://github.com/ParamagicDev/re-former)
* [bchalman's Solution](https://github.com/bchalman/odin-re-former)
* [Alex's Solution](https://github.com/alexcorremans/re-former)
* [Tommy's Solution](https://github.com/hoangtommy/re-former)
* [Brendaneus' Solution](https://theodinprojects.live/courses/ruby-on-rails/projects/re-former)
* [Leila Alderman's Solution](https://github.com/leila-alderman/re-former)
* [JamCry's Solution](https://github.com/jamcry/re-former)
* [vanny96's Solution](https://github.com/vanny96/forms-project)
* [Roy's solution](https://github.com/RoyNyaga/re_former_odin_project/tree/master/re_former)
* [Cody Buffaloe's Solution](https://github.com/CodyLBuffaloe/Re-Former)
* [Alex Krewson's Solution](https://github.com/alexkrewson/re-former)
* [Rey van den Berg's Solution](https://github.com/Rey810/Forms.git)
* [guacamobley's Solution](https://github.com/guacamobley/re-former)
* [Sanyogita's Solution](https://github.com/SanyogitaPandit/ruby_on_rails/tree/master/re-former)
* [Timework's Solution](https://github.com/Timework/re-former)
* [Bendee's Solution](https://github.com/bendee48/rails-reformer)
* [Robert Suazo's Solution](https://github.com/rsuazo/re-former)
* [Ken H's Solution](https://github.com/kholston/re-former)
* [Christian Páez's Solution](https://github.com/christian1894/re-former-odin-project-rails)
* [fussykyloren's Solution](https://github.com/fussykyloren/re-former)
* [Cameron St. Amant's Solution](https://github.com/CameronStAmant/forms)
</details>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.
