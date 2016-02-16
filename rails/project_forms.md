# Projects: Forms
<!-- *Estimated Time: 4-6 hrs* -->

*Don't forget to use Git to save your projects!*

These projects will give you a chance to actually build some forms, both using nearly-pure HTML and then graduating to using the helper methods that Rails provides.  The tutorial chapter will cover integrating a signup form with your Rails application and providing help if the user enters incorrect information.

## Project 1: Bare Metal Forms and Helpers

In this project, you'll build a form the old fashioned way and then the Rails way.

### Your Task

#### Set up the Back End

You'll get good at setting up apps quickly in the coming lessons by using more or less this same series of steps (though we'll help you less and less each time):

1. Build a new rails app (called "re-former").
2. Go into the folder and create a new git repo there.  Check in and commit the initial stuff.  
3. Modify your README file to say something you'll remember later, like "This is part of the Forms Project in The Odin Project's Ruby on Rails Curriculum.  Find it at [http://www.theodinproject.com](http://www.theodinproject.com)"
2. Create and migrate a User model with `:username`, `:email` and `:password`.
3. Add validations for presence to each field in the model.
5. Create the `:users` resource in your routes file so requests actually have somewhere to go.  Use the `:only` option to specify just the `:new` and `:create` actions.  
4. Build a new UsersController (either manually or via the `$ rails generate controller Users` generator).
6. Write empty methods for `#new` and `#create` in your UsersController.
7. Create your `#new` view in `app/views/users/new.html.erb`.
8. Fire up a rails server in another tab.  
9. Make sure everything works by visiting `http://localhost:3000/users/new` in the browser.

#### HTML Form

The first form you build will be mostly HTML (remember that stuff at all?).  Build it in your New view at `app/views/users/new.html.erb`.  The goal is to build a form that is almost identical to what you'd get by using a Rails helper so you can see how it's done behind the scenes.

1. Build a form for creating a new user.  See the [w3 docs for forms](http://www.w3schools.com/tags/tag_form.asp) if you've totally forgotten how they work.  Specify the `method` and the `action` attributes in your `<form>` tag (use `$ rake routes` to see which HTTP method and path are being expected based on the resource you created).  Include the attribute `accept-charset="UTF-8"` as well, which Rails naturally adds to its forms to specify Unicode character encoding.
2. Create the proper input tags for your user's fields (email, username and password).  Use the proper password input for "password".  Be sure to specify the `name` attribute for these inputs.  Make label tags which correspond to each field.
3. Submit your form and view the server output.  Oops, we don't have the right CSRF authenticity token (`ActionController::InvalidAuthenticityToken`) to protect against cross site scripting attacks and form hijacking.
4. Include your own authenticity token by adding a special hidden input and using the `#form_authenticity_token` method.  This method actually checks the session token that Rails has stored for that user (behind the scenes) and puts it into the form so it's able to verify that it's actually you submitting the form.  It might look like:

    ```language-ruby
        # app/views/users/new.html.erb
        ...
        <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
        ...
    ```

5. Submit the form again.  Great! Success!  We got a `Template is missing` error instead and that's A-OK because it means that we've successfully gotten through our blank `#create` action in the controller (and didn't specify what should happen next, which is why Rails is looking for a `app/views/users/create.html.erb` view by default).  Look at the server output above the error's stack trace.  It should include the parameters that were submitted, looking something like:

    ```language-bash
        Started POST "/users" for 127.0.0.1 at 2013-12-12 13:04:19 -0800
        Processing by UsersController#create as HTML
        Parameters: {"authenticity_token"=>"WUaJBOpLhFo3Mt2vlEmPQ93zMv53sDk6WFzZ2YJJQ0M=", "username"=>"foobar", "email"=>"foo@bar.com", "password"=>"[FILTERED]"}
    ```

    That looks a whole lot like what you normally see when Rails does it, right?

7. Go into your UsersController and build out the `#create` action to take those parameters and create a new User from them.  If you successfully save the user, you should redirect back to the New User form (which will be blank) and if you don't, it should render the `:new` form again (but it will still have the existing information entered in it).  You should be able to use something like:

    ```language-ruby
        # app/controllers/users_controller.rb
        def create
          @user = User.new(username: params[:username], email: params[:email], password: params[:password])
          if @user.save
            redirect_to new_user_path
          else
            render :new
          end
        end
    ```

7. Test this out -- can you now create users with your form? If so, you should see an INSERT SQL command in the server log.
6. We're not done just yet... that looks too long and difficult to build a user with all those `params` calls.  It'd be a whole lot easier if we could just use a hash of the user's attributes so we could just say something like `User.new(user_params)`.  Let's build it... we need our form to submit a hash of attributes that will be used to create a user, just like we would with Rails' `form_for` method.  Remember, that method submits a top level `user` field which actually points to a hash of values.  This is simple to achieve, though -- just change the `name` attribute slightly.  Nest your three User fields inside the variable attribute using brackets in their names, e.g. `name="user[email]"`.
7. Resubmit.  Now your user parameters should be nested under the `"user"` key like:

    ```language-bash
        Parameters: {"authenticity_token"=>"WUaJBOpLhFo3Mt2vlEmPQ93zMv53sDk6WFzZ2YJJQ0M=", "user" => {"username"=>"foobar", "email"=>"foo@bar.com", "password"=>"[FILTERED]"}}
    ```

4. You'll get some errors because now your controller will need to change.  But recall that we're no longer allowed to just directly call `params[:user]` because that would return a hash and Rails' security features prevent us from doing that without first validating it.  
5. Go into your controller and comment out the line in your `#create` action where you instantiated a `::new` User (we'll use it later).  
6. Implement a private method at the bottom called `user_params` which will `permit` and `require` the proper fields (see the [Controllers Lesson](/ruby-on-rails/controllers) for a refresher).  
7. Add a new `::new` User line which makes use of that new whitelisting params method.
5. Submit your form now.  It should work marvelously (once you debug your typos)!

#### Railsy Forms with `#form_tag`

Now we'll start morphing our form into a full Rails form using the `#form_tag` and `#*_tag` helpers.  There's actually very little additional help that's going on and you'll find that you're mostly just renaming HTML tags into Rails tags.

1. Comment out your entire HTML form.  It may be helpful to save it for later on if you get stuck.
1. Convert your `<form>` tag to use a `#form_tag` helper and all of your inputs into the proper helper tags via `#*_tag` methods.  The good thing is that you no longer need the authentication token because Rails will insert that for you automatically.
2. See the [Form Tag API Documentation](http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html#method-i-form_tag) for a list and usage of all the input methods you can use with `#form_tag`.
3. Test out your form.  You'll need to change your `#create` method in the controller to once again accept normal top level User attributes, so uncomment the old `User.new` line and comment out the newer one.
3. You've just finished the first step.

#### Railsy-er Forms with `#form_for`

`#form_tag` probably didn't feel that useful -- it's about the same amount of work as using `<form>`, though it does take care of the authenticity token stuff for you.  Now we'll convert that into `#form_for`, which will make use of our model objects to build the form.

1. Modify your `#new` action in the controller to instantiate a blank User object and store it in an instance variable called `@user`.
2. Comment out your `#form_tag` form in the `app/views/users/new.html.erb` view (so now you should have TWO commented out form examples).
3. Rebuild the form using `#form_for` and the `@user` from your controller.
5. Play with the `#input` method options -- add a default placeholder (like "example@example.com" for the email field), make it generate a different label than the default one (like "Your user name here"), and try starting with a value already populated.  Some of these things you may need to Google for, but check out the [`#form_for` Rails API docs](http://apidock.com/rails/ActionView/Helpers/FormHelper/form_for)
4. Test it out.  You'll need to switch your controller's `#create` method again to accept the nested `:user` hash from `params`.

#### Editing

1. Update your routes and controller to handle editing an existing user.  You'll need your controller to find a user based on the submitted `params` ID.
2. Create the Edit view at `app/views/users/edit.html.erb` and copy/paste your form from the New view.  Your HTML and `#form_tag` forms (which should still be commented out) will not work -- they will submit the form as a POST request when you need it to be a PATCH (PUT) request (remember your `$ rake routes`?).  It's an easy fix, which you should be able to see if you attempt to edit a user with the `#form_for` form (which is smart enough to know if you're trying to edit a user or creating a new one).  
3. Do a "view source" on the form generated by `#form_for` in your Edit view, paying particular attention to the hidden fields at the top nested inside the `<div>`.  See it?
4. Try submitting an edit that you know will fail your validations. `#form_for` also automatically wraps your form in some formatting (e.g. a red border on the input field) if it detects errors with a given field.
5. Save this project to Git and upload to Github.

#### Extra Credit

1. Modify your form view to display a list of the error messages that are attached to your failed model object if you fail validations.  Recall the `#errors` and `#full_messages` methods.  Start by displaying them at the top and then modify

### Student Solutions

*Send us your solution so we can show others! Submit a link to the Github repo with your files in it here using any of the methods listed on the [contributing page](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md).  Please include your partner's github handle somewhere in the description if they would like attribution.*

* [spierer's solution](https://github.com/spierer/odin-forms)
* [Jamie's solution](https://github.com/Jberczel/odin-projects/tree/master/re-former) | [walkthrough](http://jberczel.github.io/forms-walkthrough/)
* [Afshin M's solution](https://github.com/afshinator/re-former)
* [Marina Sergeyeva's solution](https://github.com/imousterian/OdinProject/tree/master/Project3_Forms/re-former)
* [Donald's solution](https://github.com/donaldali/odin-rails/tree/master/re-former)
* [Vincent's solution](https://github.com/wingyu/Practice_forms)
* [Tommy Noe's solution](https://github.com/thomasjnoe/re-former)
* [Kate McFaul's solution](https://github.com/craftykate/odin-project/tree/master/Chapter_04-Advanced_Rails/forms)
* [Nikola Čvorović's solution](https://github.com/cvorak/re-former)
* [Jason Matthews' solution](https://github.com/fo0man/re-former)
* [Sasikala's solution](https://github.com/Sasikala-Ravichandran/re-former)
* [Dominik Stodolny's solution](https://github.com/dstodolny/re-former)
* [Julian Feliciano's solution](https://github.com/JulsFelic/re-former)
* [Trump's solution](https://github.com/trump812/OdinProject/tree/master/Ruby_on_Rails/re-former)
* [Lara Finnegan's solution](https://github.com/lcf0285/re-former)
* [Kevin Mulhern's solution](https://github.com/KevinMulhern/re-former)
* [Eduardo Frias' solution](https://github.com/feek1g/theodinproject/tree/master/RubyOnRails/re-former)
* [Frank Peelen's solution](https://github.com/FrankPeelen/re-former)
* [Raycotek's solution](https://github.com/Raycotek/Re-Former)
* [dchen71's solution](https://github.com/dchen71/re-former)
* [Matias Pan's solution](https://github.com/kriox26/re-former)
* [Tomislav Mikulin's solution](https://github.com/MrKindle85/re-former)
* [Alex Chen's solution](https://github.com/Chenzilla/re-former)
* [Dan Hoying's solution](https://github.com/danhoying/re_former)
* [Hassan Mahmoud's solution](https://github.com/HassanTC/re-former)
* [Aviv Levinsky's solution](https://github.com/pugsiman/re-former)
* [Florian Mainguy's solution](https://github.com/florianmainguy/theodinproject/tree/master/rails/re-former)
* [Alex Tsiras' solution](https://github.com/arialblack14/re-former)
* [cdouglass's solution](https://github.com/cdouglass/odin-project-exercises/tree/master/rails/re-former)
* [Radi Totev's solution](https://github.com/raditotev/re-former)
* [srashidi's solution](https://github.com/srashidi/Forms/tree/master/re-former)
* [Luke Walker's solution](https://github.com/ubershibs/rails_course/tree/master/re-former)
* [Scott Bobbitt's solution](https://github.com/sco-bo/re-former)
* [Matt Velez's solution](https://github.com/Timecrash/rails-projects/tree/master/re-former)
* Add your solution above this line!


## Project 2: Ruby on Rails Tutorial

This chapter will take what you now know about forms and make it part of a real application instead of just a learning exercise.  You'll build out the user signup form for the Twitter-clone project and integrate it with the validations you created on the database in the previous chapter.  

### Your Task

1. Do the [Ruby on Rails Tutorial Chapter 7](https://www.railstutorial.org/book/sign_up), "Sign-Up".

## Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*
