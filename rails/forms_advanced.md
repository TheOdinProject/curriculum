### Introduction

You learned about the basics of building forms in HTML and Rails in previous lessons and you can do a whole lot with that knowledge.  But there are also cases when crafting a good user experience demands building a form that handles multiple things (e.g. model objects) at once.  Users only like clicking the submission button once so you'd better be able to give them the simple experience they demand.

In this section, we'll take a look at some of the options you have to make a form handle multiple model objects at once.  You'll also learn how to prepopulate a dropdown menu with objects.

### Learning Outcomes
Look through these now and then use them to test yourself after doing the assignment:

* How do you prepopulate a dropdown menu with data?
* What is the difference between the `#select_tag` helper and the `#select` helper?
* What format does the array you input to `#options_for_select` need to be in?
* Why would you need to use a nested form?
* What do you need to change in the model to allow nested forms to create new objects properly?
* How do you whitelist the nested parameters properly in your controller?
* Why can't you just delete something by leaving a form field (e.g. a checkbox) blank (unchecked)?

### Prepopulating `select` Tags with Collections

Rails provides you with a few handy ways of making dropdown menus which already contain data when the form is loaded (otherwise they're not that useful).

Let's say you want to build a New Post form for your blog but you want to be able to select who the author is from among your list of users.  You will need to make a dropdown which submits the user's ID as a part of your `params` hash.  So you might populate `@users` in your posts controller:

~~~ruby
  # app/controllers/posts_controller.rb
  ...
  def new
    @users = User.all
    @post = Post.new
  end
  ...
~~~

The bare HTML way is to build a bunch of `<option>` tags (inside your `<select>` tag).  You could easily create these in your ERB code by just iterating over some collection, for instance if you'd like to select a post to view from a list of them.

~~~html
  # app/views/posts/new.html.erb
  ...
  <select name="user_id">
    <%= @users.each do |user| %>
      <option value="<%= user.id %>"><%= user.name %></option>
    <% end %>
  </select>
  ...
~~~

This creates a dropdown list with each user's name as an option.  Your `#create` action will receive an attribute called `user_id` and you can use it to match an author to that post.

But Rails provides some less verbose ways of doing the same thing, namely using the `#select_tag` helper in conjunction with the `#options_for_select` helper.  The `#select_tag` will create the surrounding tag while the `#options_for_select` gives `#select_tag` the array of options it needs.

`#options_for_select` expects a very specific input -- an array of arrays which provide the text for the dropdown option and the value it represents.  So `options_for_select([["choice1",1],["choice2",2]])` creates a couple of option tags, one for each choice.  This is great, because that's exactly what `#select_tag` expects for its second argument.  The only wrinkle here is that you need to convert your `@users` collection, which has full User objects, into a simple array with just `name` and `value`.  That's easy using `#map`:

~~~ruby
  # app/controllers/posts_controller.rb
  ...
  def new
    @user_options = User.all.map{ |u| [ u.name, u.id ] }
    @post = Post.new
  end
  ...

  # app/views/posts/new.html.erb
  ...
  <%= select_tag(:author_id, options_for_select(@user_options)) %>
  ...
~~~

So just pass `#select_tag` the name it should use for your chosen value and the collection and it will output the exact same thing!

If you want to avoid the whole `options_for_select` thing altogether and your form is designed to build a model instance (e.g. a Post object), just use the more generic `#select` helper in your view:

~~~ruby
  # app/views/posts/new.html.erb
  ...
  <%= select(:post, :author_id, @user_options) %>
  ...
~~~

You still need to pass it the `:post` parameter (which indicates that your form is building a Post object) so the `select` tag can get the `name` right... in this case, it will name the tag `<select name="post[author_id]" id="post_author_id">`.  That means (remember!) that the `author_id` attribute will show up in your `params` nested under the `post` hash.

The `:author_id` input to the `#select` helper above represents not just what the chosen value should be called (as in the `#select_tag`) but also which column name it represents in your original (in this case Post) model.  This may be a bit annoying at first since you can't just name your choice whatever you want.

If you have a `#form_for` form scoped under the `f` variable, you don't need to pass the `:post` symbol above (it gets it from `f`), so could instead use:

~~~ruby
  # app/views/posts/new.html.erb
  ...
    <%= f.select(:author_id, @user_options) %>
  ...
~~~

It took a bit of time for us to get here, but hopefully you can now see how straightforward this method is for generating a potentially large dropdown.

You'll use dropdowns a lot to populate the association of a model, e.g. the author of a Post.  In the next section, we'll talk about how to actually create both model objects from within a single form.

*Note: If you've used the `simple_form` gem, it has its own way of handling collections of objects which is a bit different (supposedly `simpler`) than this.*

### Nested Forms

You've got a form for creating one of your User objects (say for your Amazon.com clone application) but you also want to make that form create one or more ShippingAddress objects (which a User can have many of).  How do you get that one form to create both so your user doesn't get stuck clicking a bunch of form submits?

This is a multi-part process.  It involves your controller, view, models and routes... the whole MVC team!  The gist of it is that your form will submit the main object (e.g. the User) as normal but it will sneak in a bunch of attributes for the other object(s) you want to create (e.g. ShippingAddress object(s)).  Your model will have to be ready for this.  It will create not just the original User object but also the nested objects at the same time.

As you can imagine, it's important to get the names and parameters properly listed so all this magic can happen behind the scenes.

We'll do a broad overview of the process here:

1. You will need to prepare the User model so that it knows to create one or more ShippingAddress objects if it receives their attributes when creating a normal User.  This is done by adding a method to your User model called `#accepts_nested_attributes_for` which accepts the name of an association, e.g:

~~~ruby
  # app/models/user.rb
  class User < ActiveRecord::Base
    has_many :shipping_addresses
    accepts_nested_attributes_for :shipping_addresses
  end
~~~

2. Make sure you've allowed your `params` to include the nested attributes by appropriately including them in your Strong Parameters controller method.  See the reading for examples of how to do this.
3. Build the form in the view.  Use the `#fields_for` method to effectively create a `#form_for` inside your existing `#form_for` form.

There are a couple new aspects to this process.  You saw `#fields_for` in the [Basic Forms lesson](/courses/ruby-on-rails/lessons/form-basics) but it probably has new meaning to you now.  It's basically how you create a form within a form (which should make sense since it's actually used behind the scenes by `#form_for`).  In this example, we might create three "sub-forms" for ShippingAddress objects by using our association, e.g.

~~~ruby
  <%= form_for @user do |f| %>
    ...
    <% 3.times do %>
      <%= f.fields_for @user.shipping_address.build do |addy_form| %>
        ...
        <%= addy_form.text_field :zip_code %>
        ...
      <% end %>
    <% end %>
    <%= f.submit %>
  <% end %>
~~~

Note that we could (and should) also have built the new shipping_address objects in the controller instead of the view; it's just for demonstration purposes here.

The `#accepts_nested_attributes_for` method is fairly straightforward and the docs should be helpful.

The reading will cover more about whitelisting the nested parameters.

### Deleting Nested Form Objects

You can also have your form destroy nested forms by first setting the `:allow_destroy` option to `true` for the `#accepts_nested_attributes_for` method, e.g. `accepts_nested_attributes_for :shipping_addresses, :allow_destroy => true`.  Now, any time you want to destroy a ShippingAddress object from a User's form, just include the key `_destroy => 1` in the submitted parameters for that ShippingAddress.

### Many-to-Many Relationships

If you've got a `has_many :through` relationship, you'll likely need to go one additional step further by specifying that each side of your relationship is the inverse of the other.  It's detailed in [this blog post from ThoughtBot](http://robots.thoughtbot.com/accepts-nested-attributes-for-with-has-many-through).

### Designing Your Own Forms

Sometimes, despite all the nice helpers Rails gives you, you just want to do something that's not standard.  You should first wonder whether this is the easiest and most straightforward way to do things.  If it passes the smell test, then go ahead and build your form.

It's often easiest (and good practice while you're learning) to start with the most basic of HTML forms.  If you don't understand what's going on in the basic HTML (and remember to include your CSRF token), then you'll be hopeless trying to use helpers.  Once you've got a good handle on things, gradually bring in the Rails helpers like `#form_tag` and `#form_for`.

Don't get discouraged if you get some real head-scratcher moments when building nonstandard forms.  It just takes some experience to feel comfortable.  And if things are too out of hand, you may need to re-evaluate your approach (what exactly are you hoping to accomplish with your complex form?) and start again.

### Simple Form

`simple_form` is a gem by Platformatec which can really make your life easier (if you aren't doing anything too crazy).  It provides lots of user-friendly features for building forms and is in wide use today.  We won't cover it explicitly here (though it's used in the tutorial we're following).

It's up to you to check out [the documentation](https://github.com/plataformatec/simple_form) and start using it in your own applications as desired.

### Miscellania: Blank Submissions That Mean Delete

Sometimes, for a record that already exists, you want to either deselect a dropdown or check none of your checkboxes but you want this to indicate that the associated fields should actually be set to `nil`.  Usually, though, if you submit the form it will include none of the fields and your back end won't know that you actually wanted to remove those fields so nothing will happen.  How do you get around it?

Try making a hidden field in your form (or nested form) that has the same name as your checkboxes or dropdown but only contains the value `""`.  Now you'll get that attribute to show up in your `params` hash no matter what and you can handle deleting the records however you'd like appropriate.

Sometimes Rails helper methods will do it for you, but make sure you know what your form is actually submitting (if anything) if you deselect all options!

### Assignment
<div class="lesson-content__panel" markdown="1">
  1. Read the [Rails Guide on Forms](http://guides.rubyonrails.org/form_helpers.html#option-tags-from-a-collection-of-arbitrary-objects) sections 3.3, which covers populating a form with a collection of objects.
  2. Read the [Same Rails Guide on Forms](http://guides.rubyonrails.org/form_helpers.html#building-complex-forms) section 9, which covers accepting nested form data.
  3. Read the [Same Rails Guide on Forms](http://guides.rubyonrails.org/form_helpers.html#understanding-parameter-naming-conventions) section 7, which covers the parameter conventions for nested forms.
  4. Read [this blog post from Peter Rhoades](http://createdbypete.com/articles/working-with-nested-forms-and-a-many-to-many-association-in-rails-4/) on working with nested forms.  The example covers a lot of the things we've gone over so far, so follow along.  Also note how he does the whitelisting of nested attributes in Rails 4.
</div>

### Conclusion

We've covered two of the more common use cases for complex forms -- pre-populating a form with objects and creating multiple objects with a single form.  At this point, even if you're uncomfortable, you should have all the tools you need to work through creating a form.  We'll get your hands dirty in the project, have no fear.

The best part?  This is more or less the most complicated conceptual stuff with learning Rails.  Actually, it's not even really Rails-specific... once you're comfortable with the HTML that forms require and how the parameters get submitted to your controller, mapping that to the correct Rails conventions or helpers is the easy part.  So everything you've learned may just be transferrable to every form you'll ever make.

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* [Simple Form Documentation on Github](https://github.com/plataformatec/simple_form)
* [`accepts_nested_attributes_for` documentation](http://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html)
* [Another example of a nested form on SO](http://stackoverflow.com/questions/15648396/rails-how-to-manage-nested-attributes-without-using-accepts-nested-attributes?rq=1)
* [Using `inverse_of` to make `accepts_nested_attributes_for` work for `has_many :through` relationships](http://robots.thoughtbot.com/accepts-nested-attributes-for-with-has-many-through)
* [Understanding Rails' form authenticity tokens](http://stackoverflow.com/questions/941594/understand-rails-authenticity-token)
* [Why not to hardcode your application's secret token in production](http://daniel.fone.net.nz/blog/2013/05/20/a-better-way-to-manage-the-rails-secret-token/)
