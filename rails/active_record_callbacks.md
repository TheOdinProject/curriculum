### Introduction

Callbacks are a common way for you to execute code at specific times in the life cycle of an Active Record object, for instance just before it is created, after it is saved, or after it is destroyed.  These can be very useful if you've got something to execute whenever an object hits one of those lifecycle points, like modifying the user's email to be lowercase when creating her account.  Callbacks are a way of saying something like "Hey Active Record, when you've finished creating a new User object, give me a call so I can run this method before anything else happens."

This is a brief section on a useful topic.  The Rails Guide reading provides good coverage of it, so my summary will be necessarily brief.

### Learning Outcomes
Look through these now and then use them to test yourself after doing the assignment:

* What is a callback used for?
* What are the major lifecycle stages of an Active Record object?
* How do you build an "around" callback?
* How do you specify a particular action to run a callback for?

### The Life Cycle of an Active Record Object

Callbacks provide hooks into specific points (either before, after, or sometimes "around") in the life cycle of an object.  Those life cycle moments are:

* **Initialization** -- When the object is first built OR whenever it is reloaded from the database and into memory (so any time you find it in a query).
* **Validation** -- whenever Rails checks if the object is valid.  That could be when you're trying to save it or if you've manually run the `#valid?` method.
* **Saving** -- The actual act of saving an already-built object to the database.  This is triggered any time the object is saved, not just the first time it is created.
* **Creating** -- The creation and saving of a new object.
* **Updating** -- The updating of an existing object.
* **Finding** -- When you've searched for the object.  Often gets triggered by Rails working with objects behind the scenes (e.g. when )

You often get three choices for callbacks.  Not all object lifecycle steps support all callbacks, but the basic three are (using `create` as an example):

1. `before_create` -- Runs the method before the stated action
2. `after_create ` -- Runs the method after the stated action
3. `around_create` -- A bit trickier.  In this one, you will write a method which actually `yield`'s at some point to the original action.  That way you can have code before it and after it and YOU decide at which point the original action gets done.  Not entirely common.

### Using Callbacks

To use a callback, you need to "register" it at the top of your Model by using the appropriate method (e.g. `before_create`).  You pass that method either a symbol which corresponds to a method name or you could just write the callback as a block then and there.  Rails will hang onto that method and call it at the appropriate time.  For example:

~~~ruby
  # app/models/user.rb
  class User < ActiveRecord::Base

    before_create do |user|
      puts "about to create #{user.name}"
    end

    after_create :just_created

    private

    def just_created
      puts "just created a user"
    end
  end
~~~

### Specifying Callback Characteristics

Callbacks give you several options for narrowing down or selecting specifically when you want them to run.  If you only want to run a callback when a particular controller action calls it, use the `:on` option, which takes either a single symbol or a full array, e.g. `before_create :run_code, :on => [:create, :update]`.

You can also use conditional logic options `:if` and `:unless` to try a method before running callbacks, for instance:

~~~ruby
  before_create :run_code, :unless => :method_is_true

  private

  def method_is_true
    true
  end
~~~

### Transaction Callbacks

Sometimes your Rails app will need to interact with an external application (which is inherently imperfect) as a part of the save process.  Other times your save will involve juggling several balls at once and, if one fails, they all need to be rolled back.  Typically these cases will involve wrapping your database save operation in a "transaction", which means that either all the steps work or they all fail and are rolled back.

The `commit`ting of a transaction and its potential `rollback` if it fails are both lifecycle events that you can latch onto with callbacks, e.g. `after_commit` and `before_rollback`.  This is uncommon, so consider it another one of those "just remember that it's an option" type things.

### Assignment

<div class="lesson-content__panel" markdown="1">
  1. Read through the [Rails Guide on Callbacks](http://guides.rubyonrails.org/active_record_callbacks.html)
  2. Read [this post from Samuel Mullen](http://samuelmullen.com/2012/01/guidelines-for-using-activerecord-callbacks/) on guidelines for using callbacks.
</div>

### Conclusion

Callbacks are useful and many, like `:after_create` and `:before_destroy` are pretty common.  There's no rocket science here, just a helpful concept.

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something

* [WikiBooks Reference on Callbacks](http://en.wikibooks.org/wiki/Ruby_on_Rails/ActiveRecord/Callbacks)
