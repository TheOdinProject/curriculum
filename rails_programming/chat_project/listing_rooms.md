### Creating Rooms

We've dealt with serving a static page which covered both Views and Controllers but now we're going to dive into the M in MVC. A model represents the data structures for our application. It is responsible for managing the data, logic and rules of our application. Typically you would use a database to store this data.

We'll start with creating our room model. A room represents a chatroom in our application and will eventually house all the messages sent by the participants of the room.

Just as we did for the controller we made for our home page we can create a model using a Rails generator. In the terminal when in the rails root directory we can run `rails generate model` which will then print out all the command line options for creating a Rails model.

```bash
Usage:
  rails generate model NAME [field[:type][:index] field[:type][:index]] [options]

Options:
  [--skip-namespace], [--no-skip-namespace]  # Skip namespace (affects only isolated applications)
  [--force-plural], [--no-force-plural]      # Forces the use of the given model name
  -o, --orm=NAME                                 # ORM to be invoked
  # Default: active_record

ActiveRecord options:
  [--migration], [--no-migration]        # Indicates when to generate migration
  # Default: true
  [--timestamps], [--no-timestamps]      # Indicates when to generate timestamps
  # Default: true
  [--parent=PARENT]                      # The parent class for the generated model
  [--indexes], [--no-indexes]            # Add indexes for references and belongs_to columns
  # Default: true
  [--primary-key-type=PRIMARY_KEY_TYPE]  # The type for primary key
  --db, [--database=DATABASE]                # The database for your model's migration. By default, the current environment's primary database is used.
  -t, [--test-framework=NAME]                # Test framework to be invoked
  # Default: rspec

Rspec options:
  [--fixture], [--no-fixture]   # Indicates when to generate fixture
  [--fixture-replacement=NAME]  # Fixture replacement to be invoked

Runtime options:
  -f, [--force]                    # Overwrite files that already exist
  -p, [--pretend], [--no-pretend]  # Run but do not make any changes
  -q, [--quiet], [--no-quiet]      # Suppress status output
  -s, [--skip], [--no-skip]        # Skip files that already exist

Description:
  Stubs out a new model. Pass the model name, either CamelCased or under_scored, and an optional list of attribute pairs as arguments.

  Attribute pairs are field:type arguments specifying the
  model's attributes. Timestamps are added by default, so you don't have to
  specify them by hand as 'created_at:datetime updated_at:datetime'.

  As a special case, specifying 'password:digest' will generate a
  password_digest field of string type, and configure your generated model and
  tests for use with Active Model has_secure_password (assuming the default ORM
  and test framework are being used).

  You don't have to think up every attribute up front, but it helps to
  sketch out a few so you can start working with the model immediately.

  This generator invokes your configured ORM and test framework, which
  defaults to Active Record and TestUnit.

  Finally, if --parent option is given, it's used as superclass of the
  created model. This allows you create Single Table Inheritance models.

  If you pass a namespaced model name (e.g. admin/account or Admin::Account)
  then the generator will create a module with a table_name_prefix method
  to prefix the model's table name with the module name (e.g. admin_accounts)

Available field types:

  Just after the field name you can specify a type like text or boolean.
  It will generate the column with the associated SQL type. For instance:

  `rails generate model post title:string body:text`

  will generate a title column with a varchar type and a body column with a text
  type. If no type is specified the string type will be used by default.
  You can use the following types:

  integer
  primary_key
  decimal
  float
  boolean
  binary
  string
  text
  date
  time
  datetime

  You can also consider `references` as a kind of type. For instance, if you run:

    `rails generate model photo title:string album:references`

  It will generate an `album_id` column. You should generate these kinds of fields when
  you will use a `belongs_to` association, for instance. `references` also supports
  polymorphism, you can enable polymorphism like this:

    `rails generate model product supplier:references{polymorphic}`

  For integer, string, text and binary fields, an integer in curly braces will
  be set as the limit:

    `rails generate model user pseudo:string{30}`

  For decimal, two integers separated by a comma in curly braces will be used
  for precision and scale:

    `rails generate model product 'price:decimal{10,2}'`

  You can add a `:uniq` or `:index` suffix for unique or standard indexes
  respectively:

    `rails generate model user pseudo:string:uniq`
    `rails generate model user pseudo:string:index`

  You can combine any single curly brace option with the index options:

    `rails generate model user username:string{30}:uniq`
    `rails generate model product supplier:references{polymorphic}:index`

  If you require a `password_digest` string column for use with
  has_secure_password, you can specify `password:digest`:

    `rails generate model user password:digest`

  If you require a `token` string column for use with
  has_secure_token, you can specify `auth_token:token`:

    `rails generate model user auth_token:token`

Examples:
  `rails generate model account`

    For Active Record and TestUnit it creates:

      Model:      app/models/account.rb
      Test:       test/models/account_test.rb
      Fixtures:   test/fixtures/accounts.yml
      Migration:  db/migrate/XXX_create_accounts.rb

  `rails generate model post title:string body:text published:boolean`

    Creates a Post model with a string title, text body, and published flag.

  `rails generate model admin/account`

    For Active Record and TestUnit it creates:

      Module:     app/models/admin.rb
      Model:      app/models/admin/account.rb
      Test:       test/models/admin/account_test.rb
      Fixtures:   test/fixtures/admin/accounts.yml
      Migration:  db/migrate/XXX_create_admin_accounts.rb
```

This can seem a bit daunting to read through at first but it's a great way to get a quick idea of the options available to us when using a generator. From the examples provided we can see that to create a model we can use `rails generate model` and then pass in the name of the model we want to create as well as specify the names and types of the model attributes which, if you are using a database, will form the columns of the database tables.

Let's think about our room model. It only needs to have a name for the room which will be of type string. We should limit the number of characters for each room name to 20 characters and we want each room name to be unique, as two rooms with the same name would be confusing. If you did read through all of the rails generator options above then you may already have an idea of how we can accomplish this. If you didn't, or if you did read it and can't remember all the options, like me, then take 2 minutes now to skim through it and see if you can figure out what command would accomplish what we want to do.

Now that you should hopefully have an idea let's run the following command in the terminal. Make sure you are in your Rails project directory.

```bash
rails generate model Room name:string{20}:uniq
```

This has told Rails to generate a model for us with a name attribute. The name should be no more than 20 characters long and should be unique.

If you look at the output in the terminal from running that command you'll see a list of all the actions taken including files created and files appended to.

# TODO Add text output of Rails model migration and explain

# TODO explain migrations

The migration file created by the rails model generator are the blueprint for creating the database table. To actually open the database connection and create the table we need to run another command but before we do that let's take a moment to look at the migration file.

# TODO show and explain migration file

We want to ensure that no room can be created in the database without a name. Rails gives us the chance to do this in the migration file before migrating it.

Open up the migration and locate the line which declares the room name and the `null: false` option.

```ruby
t.string :name, null: false
```

This tells Rails to set a contraint on the database itself that it should not allow a room entry into the database if there is no value for room. Save the file and then in the terminal run the following command

```bash
rails db:migrate
```

You should see a success message confirming the migration was successful. If you get an error it's usually from a typo in the field type. For example if you were selecting an integer type and accidentally wrote interger then an error would be thrown when you try to migrate. With any error first don't panic that it hasn't worked as expected, it's normal and happens all the time, then look at where the error is originating and usually it will give you an indication of the problem.

Although we have added some constraints on the database we should also consider adding some at application level. There are two main reasons for this.

1) We do not want to have to open a database connection every time just to check if the data is valid. This is an unnecessary process to run and times of a high volume of users could slow things down noticeably. Also database validations can differ in how they work depending on the type of database you use.
2) There are some other restrictions we may want to set. For the room name we entered a maximum value and made sure it couldn't be a blank name but what if we wanted a minimum value because having a load of room names of one character isn't desirable?

The solution to this is validations. Validations are quite a big topic, in fact it has an entire [Rails Guides Chapter](https://guides.rubyonrails.org/active_record_validations.html) on it. You don't need to memorise all the possible validations now. Instead, have a skim through the options and then when you are ready to implement your own validations just remember to have a look at the guide to implement the contraints you wish to place on your models.

We already have three constraints we need to implement that we applied at database level. We want to make sure a room name is not empty, we want to make sure it doesn't exceed some maximum value, and we want to make sure a room name is unique. Having browsed the validations page, or by browsing it again now see if you can work out how we might implement those.

To implement a value being present we can use the [presence](https://guides.rubyonrails.org/active_record_validations.html#presence) validation, to validate the length of the room being passed in we can use the [length](https://guides.rubyonrails.org/active_record_validations.html#length) validation and to check a room name doesn't already exist we can use the [uniqueness](https://guides.rubyonrails.org/active_record_validations.html#lengt://guides.rubyonrails.org/active_record_validations.html#uniqueness) validation. To check if a value is unique does require a database connection to be opened to check the other records already created. For uniqueness we also want it to be case insensitive because a room named `Odin` or a room named `odin` should be considered the same room in our application.

Open up the model in app/models/room.rb and add the following line inside the model 

```ruby
class Room < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { in: 4..20 }
end
```

Now that we've written some validations we can test them in the rails console. In a terminal navgiate to the Rails project folder and type `bundle exec rails console`. The rails console is built around the Ruby IRB but makes available all of the Rails load path so you can play around and test parts of your application.

We want to create a new room and Rails gives us some options to do that. the `new` method will create a new object in memory when called on a model but it won't try and save it to the database. The `create` method is like new, except it does try to save it to the database when created. We can play around with these in the console.

In your rails console type the following

```bash
room = Room.new
```

This creates a new room object in memory. If you closed the console now the object would be destroyed and would no longer be accessible.

To see what was created type

```bash
room
```
and you should see a representation of the object that was created.

```bash
#<Room id: nil, name: nil, created_at: nil, updated_at: nil>
```

Here we can see that a room object has been created, but all attributes are currently set to nil. The id, created_at and updated_at attributes are all generated by Rails at the time the object is saved to the database so we don't need to worry about that.

To see if our object is valid we can try the `.valid?` method

```bash
room.valid?
Room Exists? (0.9ms)  SELECT 1 AS one FROM "rooms" WHERE "rooms"."name" IS NULL LIMIT ?  [["LIMIT", 1]]
=> false
```

What you can see here is that Rails did need to open a database connection to see if the room already exists. This is because of the uniqueness constraint that we put on the model. We can see here it has come back false. In our case we may have an idea why, but sometimes when working with your own models you may feel they are valid but still not saving. In this case you can call the `.errors` method to get back an object with details of what is stopping the object from saving to the database.

```bash
room.errors
=> #<ActiveModel::Errors:0x00007fd140121b00 @base=#<Room id: nil, name: nil, created_at: nil, updated_at: nil>, @messages={:name=>["can't be blank", "is too short (minimum is 4 characters)"]}, @details={:name=>[{:error=>:blank}, {:error=>:too_short, :count=>4}]}>
```

Here we can see all the errors being raised. To see a more consise summary try `room.errors.details`

```bash
room.errors.details
=> {:name=>[{:error=>:blank}, {:error=>:too_short, :count=>4}]}
```

Here we can see under `:name` that there are two errors, the first is that the name cannot be blank (we tried to submit a nil value for name) and also that it is too short. It should be at least four characters.

It's worth noting here that errors is only populated after you try and validate an object either by calling `.valid?` or by trying to save it to the database. If you create a new object and call `.errors` on it you won't any details provided because the object hasn't been checked against the validations yet. Also note we didn't see an error for our uniqueness validation because we haven't created any other rooms yet in the errors object.

To give our room a name we just need to set it using basic Ruby assignment. Although in the model you don't see any attributes being set, Rails does this for us using metaprogramming. It takes the columns in our database tables and makes them available on the object as attributes saving you having to do `attr_accessors` for each attribute in the model.

In the console give your room a name. It should be 4 or more characters no more than twenty.

```bash
room.name = "Odin is meh"
```

Assuming you didn't get struck by lightning for that blasphemy we should now have a model that is valid. It meets all of our constraints in that the room name is unique, it is more than 4 and less than 20 characters, and it isn't blank. We can test this once again by calling the `valid?` method

```bash
room.valid?
Room Exists? (4.4ms)  SELECT 1 AS one FROM "rooms" WHERE "rooms"."name" = ? LIMIT ?  [["name", "Odin is meh"], ["LIMIT", 1]]
=> true
```

Now all we need to do is save it. Rails provides us with the `save` method for just this thing.

```bash
room.save

Room Create (2.8ms)  INSERT INTO "rooms" ("name", "created_at", "updated_at") VALUES (?, ?, ?)  [["name", "Odin is meh"], ["created_at", "2020-07-09 11:53:59.352161"], ["updated_at", "2020-07-09 11:53:59.352161"]]
(10.4ms)  commit transaction
=> true
```

The return value of `true` tells us the room was saved successfully. This value is now in the development database. Huzzah. We've saved our first model. We're all heroes!

There may be a time you want to mess around with object creation without saving anything to the database. For this Rails provides a sandbox environment that rolls back any transactions on exit. To use this simply pass in the `--sandbox` flag when opening the console. One other useful tip is that Rails also provides aliases for many commands to save on those precious keyboard button presses. For the console you can use `c` instead of typing out the full word `console`

```bash
bundle exec rails console --sandbox
bundle exec rails c --sandbox
```

To close a console just hold ctrl and press c to shut it down gracefully. Never close a terminal with a live console still running.

I hope you found that fun. Even with experience I still enjoy firing up a Rails console to test things out in. That said, we can't say we've extensively tested our Room model. You may have done this yourself messing around in the console with your object, and you can still do it now. However, as your application grows, do you really want to have to go back into the console and test every possible permutation of your code change before you can say it's production ready? And even if you do want to do that because you're a bit weird it wouldn't fly with your bosses when you get a dev job. The answer to this is writing automated tests. Not only will they give us an assurance now that our code functions as we expect, but whenever we make changes to our code we can run the tests again to make sure everything is still working as expected.

We've already discussed why RSpec and gone ahead and set things up. You should also have some experience with RSpec from the Ruby track.

Where should we start testing? The best place in this case is to test the code we've written and so we should test our validations work as expected. When we created our model it created a corresponding room_spec.rb file in /spec/models/ open this up and have a look. You can see at the top it requires our rails_helper file which itself requires the spec_helper file so all the RSpec configuration options are available to us in the file. If you do find yourself creating spec files yourself, as you will when writing system tests then be sure to remember to require the rails_helper file.

We then have an RSpec setup for our model

```ruby
RSpec.describe Room, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
```

The lesson is pending just so when you run your test suite you are notified if no tests exist in the file so the file can be deleted if you dont need it. Remove the pending line and strap in as we journey through the fast paced world of automated tests.

The first thing we can do is test that a model is valid with all attributes passed in.

```ruby
RSpec.describe Room, type: :model do
  describe 'validations' do
    context 'with valid attributes' do
      it 'is valid' do
        room = Room.new
        room.name = "Taco Talk"
        expect(room).to be_valid
      end
    end
  end
end
```

Here we create a new Room and set it to the `room` variable and we then set the name of that room. Finally we expect the room to be valid. If you are wondering where the be_valid matcher is defined, it's an RSpec feature that any predicate method that returns true or false can be made into a matcher be dropping the `?` that all predicate methods should end with and appending `be_` to it. So `be_valid` is just a syntactic way of calling the `valid?` method we used already in the Rails Console and checking the return value is true. We could instead have written the test as

```ruby
RSpec.describe Room, type: :model do
  describe 'validations' do
    context 'with valid attributes' do
      it 'is valid' do
        room = Room.new
        room.name = "Taco Talk"
        expect(room.valid?).to eq true
      end
    end
  end
end
```

and it would still have passed.

In the terminal run `bundle exec rspec` and you should see that sweet confirmation that the test passes

```bash
Finished in 0.04356 seconds (files took 1.93 seconds to load)
1 example, 0 failures
```

Let's now turn our attention to the specific validations on the model and test each one to show that a room isn't valid if we don't have a valid name. It might be very tempting to do something like the following

```ruby
RSpec.describe Room, type: :model do
  # ...

  context 'without a name' do
    it 'is not valid' do
      room = Room.new
      expect(room).not_to be_valid
    end
  end
end
```

Here just note, if you didn't know already, that `not_to` is just a way to negate the expectation. We don't want a room to be valid if there is no name so we have to expect it to be false.

This test would pass, and you might think all is well and keep writing similar tests that all passed. This is one of the most dangerous parts of writing automated tests. Not actually testing the correct thing and your tests pass giving you the false confidence that nothing is wrong with your application. But consider what we have asserted, all we have tested here is that a room with no attributes is not valid. We don't test the reason it isn't valid. If it was something else making a newly created room invalid this test would pass even if we hadn't added the validation for the presence of a name. As it is our room doesn't have any other attributes but in your own applications it will be likely you'll have several, each with their own validations and any one of them could invalidate your model being valid.

Always make sure you are actually testing what your tests are asserting. Here what we actually need to test is that when we create a room without a name, the room gives us an error that it can't be blank. Again we've already played around with the errors method in the rails console and we know that it returns a hash with the keys as the name of the attributes causing an error and the value as an array of all the reasons it fails. There may be more than one so we need to test for the actual error message thrown by a room name not being there.

I'll list all of the tests we can write to test our validations. Any comments in the code don't need to be written yourself but I have included them to explain what you are seeing.

```ruby
RSpec.describe Room, type: :model do
  describe validations do
    # ...

    context 'without the name being present' do
      it 'is invalid' do
        room = Room.new
        room.valid?
        expect(room.errors[:name]).to include "can't be blank" # we played with this in the Rails console earlier. The errors method returns a hash that looks like  {:name=>["can't be blank", "is too short (minimum is 4 characters)"]}. Each key is the name of the attribute and the value is an array of error messages. The 'include' matcher checks if the given value is present in an array.
      end
    end

    context 'when the room name already exists' do
      it 'is invalid' do
        Room.create(name: 'nacho friends') # create a room in the database so it already exists
        room = Room.new
        room.name = 'nacho friends'
        room.valid?
        expect(room.errors[:name]).to include 'has already been taken'
      end

      it 'is case insensitive' do
        Room.create(name: 'nacho friends')
        room = Room.new
        room.name = 'NaChO FrIeNdS'
        room.valid?
        expect(room.errors[:name]).to include 'has already been taken'
      end
    end

    context 'the length of a room name' do
      it 'is invalid when less than 4 characters' do
        room = Room.new
        room.name = "OMG"
        room.valid?
        expect(room.errors[:name]).to include "is too short (minimum is 4 characters)"
      end

      it 'is invalid when more than 20 characters' do
        room = Room.new
        room.name = 'a' * 21 # a little bit of Ruby to generate a string 21 characters long
        room.valid?
        expect(room.errors[:name]).to include "is too long (maximum is 20 characters)"
      end
    end
  end
end
```

Run `bundle exec rspec` and all the tests should pass. If you are getting any errors then this is a good chance to debug what the issue is. Look where the error is originating from and see if you can track it down. Reach out for help if you can't. 

Now that all of our tests are green it's time to look at them again for refactoring opportunities. Firstly, we can see that each test has the exact same line `room = Room.new`. This should be cause for concern and normally what we'd look to do is extract that into a variable that we can use again. RSpec provides the `let` or `subject` methods for this that takes the name of the variable in symbol form and then a block that returns what you want to return each time the variable is called. So we could, underneath the first `RSpec.describe` block do something like

```ruby
RSpec.describe Room, type: :model do
  subject(:room) { described_class.new } # or...
  let(:room) { described_class.new }
```

`subject` and `let` expose the symbol name you pass as a method you can call anywhere in your code and each time it is called it returns the value of the block. Not only could this DRY out our code but because it returns a new room instance each time it is called we don't need to worry about values bleeding across our tests.

`described_class` is used to reference the name of the class passed to the opening describe block. In this case `Room`.

However, although this is a great refactoring, and I wanted to make you aware of it, we aren't going to actually do it here. Instead firstly I want to discuss why the tests above are brittle and how we can approach this another way.

So why are they brittle? If you look at what we are actually testing it is prone to break our tests if the error message ever changes. It's not uncommon in production Rails apps for error messages to be customised from the defaults that Rails has provided us with here and they may be subject to change if the development team feels they need updating and this would break any test that checks for that message. This may be acceptable for a system test where you do need to check for values appearing on a page but for model tests all we want to assert is that our model has a validation on it. We don't need to worry that the validations actually work, Rails has already tested them extensively.

So how would be approach this?

It does require a little knowledge of Rails internals, which I'm going to share with you. Focus less on the actual code as it is written, and more on the underlying concepts of testing with RSpec.

Before we write the actual tests open up a rails console using `bundle exec rails c` in the terminal and when it is loaded type `Room.validators` in.

```bash
irb(main):001:0> Room.validators                                                                                        => [#<ActiveRecord::Validations::PresenceValidator:0x00007fc1480ecbd8 @attributes=[:name], @options={}>, #<ActiveRecord::Validations::UniquenessValidator:0x000000000387fbb0 @attributes=[:name], @options={:case_sensitive=>false}, @klass=Room (call 'Room.connection' to establish a connection)>, #<ActiveRecord::Validations::LengthValidator:0x000000000387eeb8 @attributes=[:name], @options={:minimum=>4, :maximum=>20}>]
```

That's cool. Rails exposes a class method we can call on a model to get an array of validations on the model. Each validation is itself an object which makes sense, because there are options you can call on each validation such as when we set the case sensitivity of the uniqueness validator. We can also see each validation has an attributes instance variable that holds the name of the model attribute that has that particlar validation. In our case as the `name` of our room has the presence validation on it, you can see it in the attributes of the `PresenceValidator`.

With all that in mind we could rewrite our presence validation test as follows (don't actually write this, you'll see what I'm going with this soon)

```ruby
context 'without the name being present' do
  it 'is invalid' do
    validator = described_class.validators.find { |validator| validator.class == ActiveRecord::Validations::PresenceValidator }
    expect(validator.attributes.include?(:name)).to be true
  end
end
```

This test would still pass, and now we are actually testing the presence of the validation itself which is what we want to test rather than what error message it spits out but you defintely can't say this is more readable. What you might end up doing is moving the code to check if it's valid into its own method, maybe called `validates_presence_of` which you could then call in your test

```ruby
def validates_presence_of(attribute)
  validator = described_class.validators.find { |validator| validator.class == ActiveRecord }
  validator.attributes.include? attribute
end

context 'without a name being present' do
  it 'is invalid' do
    expect(validates_presence_of(:name)).to be true
  end
end
```

Now our test is readable and while to an extent it is still testing implementation, it is testing Rails implementation which is very stable and highly unlikely to change. You wouldn't actually write the test this way, if you were going to go down this route you'd probably write your own RSpec matchers which is another topic on its own.

The reason I've taken you on this journey is to make the very long-winded point that someone has already taken the time to write these kind of matchers for us and we're going to use them. I could have just told you about the gem up front but I wanted to give you an idea of why this gem exists. It takes the pain out of testing for validations and associations. The gem is [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers) by Thoughtbot. The reason we're going to use them is they are very commonly used and if you do end up in a Rails job you'll probably come across them

To install it open up your Gemfile and underneath the `:development` group of gems let's add a group of gems we only need for the test environment. We won't need to use this gem for our development or production environments so there is no need to bloat our application by installing the gem in those environments.

```ruby
group :development do
  # ...
end

group :test do
  gem 'shoulda-matchers', '~> 4.0'
end
```

Save the Gemfile and in the terminal run `bundle install` to install the gem

Now we need to make sure the convenience methods are available inside our test suite. In the `spec/` directory create another directory called `support/` then open up the `rails_helper` file and uncomment the line. It was line 23 in my file

```ruby
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }
```

This will require all files in the support directory for us. Now in support let's create a file called `shoulda_matchers_support.rb` and include the following code

```ruby
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
```

This will ensure the shoulda-matchers methods are loaded into our test suite.

Now, open up our `spec/model/room_spec.rb` file and underneath the first describe block add the following code

```ruby
it { is_expected.to validate_presence_of :name }
```

Save the file and run the test suite and all of your tests should still be passing green. With that one line we've tested the presence validation is set on the name attribute of our room model. Awesome. Lazy programming for the win!

Let's add one for our uniqueness validation. The difference here is we have an option set on our validation to ensure it isn't case sensitive. Below the last test you wrote add the following line

```ruby
it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
```

Again, save and run the tests and they should still all be green.... except they aren't. You are probably seeing the red text of doom indicating a failed test. PANIC!

Don't panic!. Remember your training. Let's take a closer look at the problem.

```bash
Shoulda::Matchers::ActiveRecord::ValidateUniquenessOfMatcher::ExistingRecordInvalid:
validate_uniqueness_of works by matching a new record against an
existing record. If there is no existing record, it will create one
using the record you provide.
```

Ahhh. We neither have any existing records in our database nor have we provided one.

The solution here is to create a record that the validator can load. To create a new record we can use an rspec hook called [before](https://relishapp.com/rspec/rspec-core/v/3-9/docs/hooks/before-and-after-hooks) to create a record before any examples are run. In this case we don't need to load the record before each rspec example is executed so we can run it once before the suite of tests is evaluated. RSpec uses the `:context` argument for this. At the top of our file underneath the opening describe block let's create a new record.

```ruby
RSpec.describe Room, type: :model do
  before(:context) { Room.create(name: 'Cry for help') }
end
```

This will create a new room in the database before any of the examples are executed which the uniqueness validator can use to check that an error is raised if a record is created with the same name.

If you run the test suite again all tests should be green.

The last validation to check at this stage is for our length. See if you can figure it out by reading the shoulda matcher docs. To push you in the right direction check [here](https://matchers.shoulda.io/docs/v4.3.0/Shoulda/Matchers/ActiveModel.html#validate_length_of-instance_method). See if you can get your test passing and then check the solution below to see how they match up.

```ruby
it do
  is_expected_to validate_presence_of(:name)
    .is_at_least(4).is_at_most(20)
end
```

Hopefully you figured it out. If you're wondering why this line is split like this it's just because otherwise it would be quite long which makes it more difficult to read.

Keep the docs handy if you're using shoulda matchers for your own projects (which you should be). The last step for now is, and don't hate me, to delete all the other tests. We've managed to shink down several lines of our tests and have made them much easier to read.

We have now tested our validations like a boss. Give yourself a pat on the back..

### Step 2: Creating the controller

We've already had experience with creating a controller for our home page and this is no different. There are a couple of other differences to explain as we go through creating the CRUD routes for our application.

You'll be familiar with the command to create the controller.

In the terminal run

```bash
bundle exec rails generate controller rooms
```

# TODO: show output of above command

If you are interested in seeing all of the options just run `bundle exec rails g controller` in your terminal.

We now need to create the routes that rails will use to direct any http requests to the correct rooms controller method. The first action we need to concern ourselves with is the path which directs requests to see all of the available rooms. We want to take a url such as `localhost:3000/rooms` and direct it to the controller action that handles this. By convention requests such as `/rooms` represent the `index` of rooms which should display a list of rooms. We could write the route for our index page as follows:

```ruby
# routes.rb

get '/rooms', to: 'rooms#index'
```

This tells rails to route any request to `/rooms` to the index method in the rooms controller. This is ok but we would need to write one for each of the 7 actions per model we wanted to access and would end up looking like

```ruby
get '/rooms', to: 'rooms#index'
get '/rooms/new', to: 'rooms#new'
post '/rooms', to: 'rooms#create'
get '/photos/:id', to: 'rooms/show'
get '/photos/:id/edit', to: 'rooms#edit'
put '/photos/:id', to: 'rooms#update'
delete '/photos/:id', to: 'rooms#destroy'
```

This would become tiresome to write for every model you created. Rails has recognised this, and where you are following Rails conventions to restful resources they have provided a `resources` hook so that instead of writing the above let's you declare it in one line. Open up your routes.rb file found in the config directory and underneath the `root` path we delcared for our home page add the following line

```ruby
resources :rooms
```

This does the same thing as declaring all of the routes each time. You can even limit which actions it creates if you have a resource that doesn't require all the CRUD actions. Read more about it in the [Rails guides](https://guides.rubyonrails.org/routing.html).

Now that we have the routing setup we can focus on the controller action. The `/rooms` path will direct to the index action in the Rooms controller. Spin up a Rails server and navigate to `localhost:3000/rooms` and you'll get an error that the index action couldn't be found.

# TODO: Screenshot of error

Let's fix that. Open up the app/controller/rooms.rb file and add the index action

```ruby
class RoomsController < ApplicationController
  def index
  end
end
```

Our request would have been received as an HTML request, which just means your client (browser) expects to receive HTML back that it can render to the screen. Rails handles this by looking for a file in the views directory with the same name as the action. This only happens for get requests by default so looking back at the routes we could have created earlier the index, new, show and edit pages are accessed with a get request so Rails will expect to find in the views directory a directory matching the name of the controller, `rooms/` in this case and within that a file matching the name of the controller action the request was routed to.

In our case that means when then the index method inside the Rooms controller is called, Rails looks for an index file in the `views/rooms/` directory. By default the file will have the `.html.erb` file extension but if you are using a different templating engine to erb then it may have a different file extension.

Let's create that file. Inside `app/views/rooms` create a file called `index.html.erb`.

If you now try to access `locahost:3000/rooms` you shouldn't get an error but will see a blank screen. Let's fix that. Let us first consider how we want our Rooms to look.

#TODO add image of rooms index page to show intended look

We need a left sidebar which provides a link to all of the rooms and a larger display area. As this is an index page we aren't showing any messages but we can fill it with .... 

#TODO decide what to fill rooms index page with

The first step is to create the template for our sidebar and main page areas. We installed Bulma earlier and this is a good chance to use the stylings they provide to keep it as simple as possible. Bulma uses a (column)[https://bulma.io/documentation/columns/] template system which we can use to break up the page into column sections of varying sizes. We want to avoid getting dragged into the details too much but you can read through the columns pages to get a feel for the possibilities. A sidebar about a fifth of the page seems about right so let's start with that. We will also use the section and container bulma stylings.

```html
<section class="section">
  <div class="container">
    <div class="columns">
      <div class="column is-one-fifth">
      </div>
      <div class="column">
      </div>
    </div>
  </div>
</section>
```

We can add the code to display a list of rooms inside the first column that takes up a fifth of the page.

To be sure our code is displaying properly let's add a title to the left column which will simply state "Room List". Inside the first column we can add the following code

```html
<div class="column is-one-fifth">
  <h3 class="subtitle">Room List</h3>
</div>
```

Navigate in your browser to `localhost:3000/rooms` and you should see the subtitle on the left.

In order for us to see all of the rooms we will need a way to pass them from the controller index method to the view. Rails does this by ensuring any instance variables created in the index method are made available in the view file it loads.

We can name this instance variable `@rooms` since it will hold a list of all the rooms. We can get such a list from the database using the `all` class method that we can call on the `Room` model.

To test this out fire up a rails console in sandbox mode so that any changes aren't persisted (`bundle exec rails console --sandbox`) and when it loads try getting a list of all the rooms.

```ruby
Room.all
=> #<ActiveRecord::Relation []>
```

What is returned is a Rails object that is an array like object which holds a reference to all the Rooms. If we had any rooms created they would have appeared between the `[]` in the ActiveRecord Relation object.

Try creating one

```ruby
Room.create(name: "Carlos' Boudoir")
```
#TODO: Show output

There are a lot of ways for Rails to query the database. You can read more about the options in the [Rails Guides](https://guides.rubyonrails.org/active_record_querying.html).
Nice. We now know what we need to do to pass the list of rooms to the view. Open up the Rooms controller and inside the index method we can create our instance variable to hold a list of all of the rooms

```ruby
def index
  @rooms = Room.all
end
```

We need to list all of the rooms in the view. If there are no rooms created yet we want to tell the user they need to create a room. To do this we need to check if the `@rooms` variable is empty or not. Rails provides a helper method for this. (present?)[https://api.rubyonrails.org/classes/Object.html#method-i-present-3F] will confirm if an array or array like object contains any items. Have a look at the source code and see how simple the method actually is. Rails provides a lot of handy additional methods to make life easier for us. We can use present? to display the rooms if they are available or a message if none have been created yet.

This is a good place to start. Writing a small amount of code to get started and then filling in the details as we go.

Open up app/views/index.html.erb and below your h3 tag add the following.

```html
<% if @rooms.present? %>
  <-- Here is where we will write the code to display our rooms -->
<% else %>
  <div class="notification is-info">
    There are no rooms
  </div>
<% end %>
```

Before moving on make sure you understand what is happening in our code. There is nothing special here, it's just Ruby code so you should have a good grasp of it. We first check if the `@rooms` variable passed from our Rooms controller has anything in it using `present?`. As `@rooms` is an array like object, `present?` will return true if it has any rooms in it and the code inside the if statement will run. If `@rooms` is empty then the else part of our code will run and we can display a message in an html div that there are no rooms.

As the `@rooms` variable from our controller gives us an array like object to work with we can use all the array methods that both Ruby and Rails provide. When we want to iterate something in Ruby we reach for the each method.

Inside the `if` statement we can add the code to iterate each room. The each method in Ruby returns the object that each was called on after it was iterated. This means if you use the erb tags with `=` it will return the calling object and display it in on our website. If you ever are using `each` in erb code and see an array or activerecord object displayed on your website that is probably the culprit.

As we iterate each room in the `@rooms` variable we want to provide a link that the user can click on to show the room. We'll deal with the link in a moment but let's first write the code to iterate our rooms. Again, this is just standard Ruby code. Nothing magical about it

HTML provides us with the list element for such a task and since our list has no particular order we'll use the `<ul>` tag

When displaying the rooms we want to present them nicely. Bulma has a (menu)[https://bulma.io/documentation/components/menu/] item that can jazz up our lists to look nice

```html
<% if @rooms.present? %>
  <aside class="menu">
    <ul class="menu-list">
      <% @rooms.each do |room| %>
        <li>
          <-- Here we will add the link for each room -->
        </li>
      <% end %>
    </ul>
  </aside>
<% else %>
  <div>
    There are no rooms
  </div>
<% end %>
```

To add a link to our page we can't write plain html. To understand why we need to consider how you would write the path to show each room. Run `rails routes` in the terminal and look at the path we need to provide for editing a room. `/rooms/:id(.:format)`. If the id of your room was 1. Then you would need a path of `/rooms/1` to load the page to show that room. We couldn't know the id or the name of the room using only html so we need to use some ruby in our html to create the link.

Let us first consider how we would write this route in plain html. A link in html is the `<a>` tag and we provide the link using `href` so our link would be

```html
<a href="/rooms/1">Name of Room</a>
```

The 1 href path represents the id of the room and between the `<a>` tags where I wrote `Name of Room` would be, funnily enough, the name of the room. We will need to use some ruby to place those values.

Consider the following part of our view

```ruby
<% @rooms.each do |room| %>
  <-- Here we will add the link for each room -->
<% end %>
```

Inside our `do; end` block we have `room` available for each object in `@rooms`. We can use this inside some erb code to get the information we want. The link would become:

```html
<a href="/room/<%= room.id %>><%= room.name %></a>"
```

While this would work it is cumbersome and prone to formatting errors. Rails has recognised this and provides a lot of helper methods to write html using only ruby. You might not always know where to start looking when you want to write some code the Rails way so don't be afraid when you're writing your own projects to use a search engine to find out what you need.

Rails provides a handy (link_to)[https://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-link_to] helper method for generating links using Ruby in our views. Click the link and spend a moment reviewing how the method operates. Not all of it will make sense at this time but make sure you scroll down enough to look at the examples provided on its intended use.

Scrolling through the examples take note that `link_to` lets us use the Rails provided paths for the routes we have defined. If you have another looks at your routes in the terminal you'll see that the path to take us to the room show page is simply `room`. So we can use `room_path` along with the room as a parameter to that method to generate the path we need.

We now have everything we need to finish this up. We can use `room.name` as the first argument to link_to which will ensure each link is presented as the name of the room and we can provide `room_path(room)` using the room variable in the block to generate the correct href to each room.

In our app/views/index.html.erb file add the link_to code shown below.

```html
<% if @rooms.present? %>
  <aside class="menu">
    <ul class="menu-list">
      <% @rooms.each do |room| %>
        <li>
          <%= link_to room.name, room_path(room) %>
        </li>
      <% end %>
    </ul>
  </aside>
<% else %>
  <div>
    There are no rooms
  </div>
<% end %>
```

You may be wondering how we generate the correct path when we are passing in a room object as the argument in `room_path(room)`. As `room` is actually an activerecord relation object Rails takes the id from it to generate the correct path. With that in mind there is one more Rails trick we can use to make our code less verbose. Looking through the link_to examples you should be able to see instead of passing in a path as the second argument we can just pass in the activerecord object itself and Rails will infer we want to generate a link to show that object. You can therefore update the link to the following

```ruby
<%= link_to room.name, room %>
```

Refreshing your browser should still show the message that there are no rooms. We need to create some rooms first in order to show up in our list. Let's tackle that next.

