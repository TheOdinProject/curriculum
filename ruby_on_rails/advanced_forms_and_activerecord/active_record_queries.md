### Introduction

Up until now, we've covered the bread and butter you need to build basic queries using Active Record. After building a handful of projects and working through the tutorial, you should be comfortable making these queries.

Active Record is much more powerful than just CRUD actions on individual records. It gives you a Ruby-ish interface to do almost anything you can do with bare-metal SQL statements. You can cherry-pick individual groups of records based on specific criteria and order them however you want. You can join tables manually or query using associations set up by Rails. You can return lists of records or perform basic math like counts and averages.

All this is done at the database level, which is much faster than loading up a whole table of stuff into Ruby objects before parsing and chopping and calculating with it.

In this lesson, we'll get into the more interesting and useful areas of Active Record queries. You'll learn what Active Record actually returns and how to manipulate the returned values at will. You'll also learn how to make your queries more efficient along the way.

There's a lot of material to read and cover, but it basically follows the idea "anything you can do in SQL, you can do in Active Record". They mostly use the same terminology as well. Active Record just extends that functionality by giving you a suite of versatile methods (and concepts like Relations) to make it much more user-friendly along the way.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What an Active Record relation is.
- What lazy evaluation is.
- Commonly used Rails query methods.
- N+1 queries and why they are a concern.
- What scopes are.
- What enums are.

### Relations and lazy evaluation

Using `User.find(1)` will return an unambiguous object -- it's going to find the user with ID = 1 and give it to you as a Ruby object. But this behavior is actually unusual. Most queries don't actually return a Ruby object, they just fake it. For example:

```ruby
  User.where(id: 1)
```

Might look like it returns an array that contains a serialized User object, like:

```ruby
  [#<User id: 1, email: "foo@bar.com">]
```

But try running `User.where(id: 1).class` and you'll see that it isn't an `Array`, it's actually an instance of `ActiveRecord::Relation`. Relations are actually just really good at looking like arrays but they've got more going on.

Active Record queries return relations to be lazy. There's basically no reason to actually tell the database to execute a query until the very last possible minute. What if you never actually needed to use that query at all? What if you want to make it more complex before executing it? Relations give you that flexibility and make much more efficient use of your database's valuable time.

Relations only get executed when it becomes absolutely necessary to know what's inside them. So if your controller grabs 5 blog posts using `@posts = Post.limit(5)`, that is really passing your view a relation. It's only when the code in the view actually calls a method on `@posts` (like `@posts.first.title`) that the query will be run and the relation will get stored as a real Ruby object in memory.

This behaviour can be a bit tricky to observe if you use something like the Rails Console (`$ rails console`) to test them out, because the queries will actually be run right away in the console since it implicitly runs something like the `.inspect` method on the relation, which requires the query to be run. But try playing with building a query like we did above and checking out its `#class`... you'll usually get back `ActiveRecord::Relation`.

#### Chaining queries

Relations aren't just built for speed... they're also built for flexibility. Let's say you want to grab the first 5 posts listed in descending order (`Post.limit(5).order(created_at: :desc)`). Because `#limit` returns a Relation, `#order` takes that relation and adds its own criteria to it. You can chain together a dozen methods this way, and, when it's finally time to execute, ActiveRecord and SQL (if that's what you're using for the DB) will figure out the optimal way to structure the query to achieve the desired result.

This is the sort of behaviour that you just sort of expect to work, and Relations are what enables it to do so.

#### Why care?

You should care that ActiveRecord queries usually return Relations because you'll run into them often when coding and debugging. The knowledge should make you comfortable chaining query methods together to construct elaborate queries.

If you end up working with a Relation when you really want it to act like an Array, you can sometimes run `#to_a` on it to force it to evaluate the query.

Methods implemented in `ActiveRecord::FinderMethods` do NOT return `ActiveRecord::Relation` objects. The `#find`, `#find_by`, `#first` and `#last` methods return a single record (a model instance). `#take` returns an array of model instances. Unlike the methods that return `Relation` objects, when called, these will run SQL queries immediately.

### Beyond basic querying

You should be pretty comfortable now with queries like finding objects. The reading you do for this section will cover the basics and then dive in a bit further than before. There are a couple of new concepts worth mentioning.

#### Checking for existence

The new concept is how to check whether an object actually exists yet or not, which you may want to do before running a method which depends on the object actually having been saved already.

`#exists?` will return true/false. `#any?` will be true if any records match the specified criteria and `#many?` will be true if multiple records match the specified criteria. You can run each of these either on a model directly, a Relation, an association, or a scope (which we'll cover later). Basically, anywhere you might think of using them, they're likely to work:

```ruby
  # From the Guide:
  # via a model
  Post.any?
  Post.many?

  # via a relation
  Post.where(published: true).any?
  Post.where(published: true).many?

  # via an association
  Post.first.categories.any?
  Post.first.categories.many?
```

#### Arguments

There are multiple ways to submit arguments for most Rails query methods. You can typically use either symbols or strings or both. We prefer to stick with symbols and hashes wherever possible. You can also use `?` parameters like in normal SQL. When it's not ambiguous (e.g. if you aren't working with multiple tables) you can also choose to specify the table name or not (see #5 below). All of the following are the same:

1. `User.where(email: "foo@bar.com")`
1. `User.where("email" => "foo@bar.com")`
1. `User.where("email = 'foo@bar.com'")`
1. `User.where("email = ?", "foo@bar.com")`
1. `User.where("users.email" => "foo@bar.com")`

#### More assorted querying knowledge

Very large queries can actually be batched into lots of subqueries so they don't eat up tons of performance resources. `#find_each` does the trick. The basic principle is that it chunks the query into pieces, loading up the first piece and evaluating it before moving onto the next one. This will be helpful for you when optimizing queries but isn't really something to worry too much about up front.

`#where` queries give you a fair bit of flexibility -- they let you specify an exact value to find, a range of values to find, or several values to find. If you know what type of query you're looking for, you can almost guess the proper syntax for executing it.

The key thing to note is that `#find` returns the actual record while `#where` returns an `ActiveRecord::Relation` which basically acts like an array. So if you're using `#where` to find a single record, you still need to remember to go into that "array" and grab the first record, e.g. `User.where(email: "foo@bar.com")[0]` or `User.where(email: "foo@bar.com").first`.

`#find_by` is a really neat method that basically lets you build your own finder method. It's an alternative to using `#where` (to which you'd have to add another method like `#take` or `#first` to pull the result out of the returned array). If you want to find by a user's email, write `User.find_by(email: 'foo@bar.com')`.

`#select` should be pretty obvious to a SQL ninja like you -- it lets you choose which columns to select from the table(s), just like in SQL. To select just the ID column for all users, it's as straightforward as `User.select(:id)`. You can also use aliases like in SQL but should use quotes instead of symbols, e.g. `@users = User.select("users.id AS user_id")` will create a new attribute called `user_id`, e.g. allowing you to access `@users.first.user_id`.

### Aggregations

Just like with SQL, you often want to group fields together (or "roll up" the values under one header). For example, grouping blog posts written on a certain date. This is most useful when you also apply mathematical operations to them like `#count` or `#max`. An example (a bit more complex because it involves joining two tables) is if we want to get a count of all the blog posts categorized by each tag. We might write something like:

```bash
  Post.joins(:tags).group("tags.name").count
  # => {"tag1" => 4, "tag2" => 2, "tag3" => 5}
```


### Joins

When working with multiple tables, you'll often want to join them together. Rails associations often do the heavy lifting of setting up the joins for you if you're working with instances of an object, so you may not need to explicitly use a `#join` right away.

But if you're running queries like in the Post-Tag-count grouping example used above, you'll need to use joins to bring together the appropriate tables. You need to be more careful with how you select data when using joins -- if you are looking for the `:id` column, which table's ID are we asking for? You'll find yourself using more explicit strings when joining, e.g. in the example above (copied below) where we specify the `name` attribute of the `tags` table:

```bash
  Post.joins(:tags).group("tags.name").count
  # => {"tag1" => 4, "tag2" => 2, "tag3" => 5}
```

### N+1 queries and eager loading

If you want your application to run with any kind of efficiency at all, you should strive to reduce the number of queries that are run on your database as much as possible. That means figuring out ahead of time exactly what you're looking for and then building the correct query to grab that thing one time only.

It's okay to grab the SAME information multiple times... Rails caches the first result anyway so it doesn't result in a performance hit. But there are situations where you force the `ActiveRecord::Relation` that is returned by a query to execute itself immediately and then you try to run queries on each member of the collection. That's a whole lot of queries and can quickly slow your application down to a snail's pace.

The N+1 query problem is the classic case of this -- you grab all the records for your users (`User.all`) then loop through each user and call an association it has, like the city the user lives in (`user.city`). For this example we're assuming an association exists between User and City, where User `belongs_to` a City. This might look like:

```ruby
  User.all.each do |user|
    puts user.city
  end
```

This is going to result in one query to get all the users, then another query for each user to find its city through the association... so N additional queries, where N is the total number of users. Hence "N+1" problems. Note that it's totally fine to just grab a regular attribute of User like `user.name`... it's because you're reaching through the association with City that we've got to run another full query.

If the best way to make an application run faster is to reduce database calls, we've just messed up badly by causing a potentially huge number of them.

Rails is well aware of your distress and has provided a solution -- "eager loading". When you first grab the list of all users, you can tell Rails to also grab the cities at the same time (with just one additional query) and store them in memory until you'd like to call upon them. Then `user.city` gets treated the same way as `user.name`... it doesn't run another query. The trick is the `#includes` method.

```ruby
  User.all.includes(:city).each do |user|
    puts user.city
  end
```

`#includes` basically takes the name of one or more associations that you'd like to load at the same time as your original object and brings them into memory. You can chain it onto other methods like `#where` or `#order` clauses.

<div class="lesson-note" markdown="1">

Note: One thing which can be a bit annoying from a development standpoint is that we haven't found an easy way to "see" your eager-loaded fields by looking at the output from your Rails server. So don't be alarmed if they don't show up in the server output.

</div>

Almost as useful is the `#pluck` method, which is covered in the Rails Guide. `#pluck` lets you skip several steps in the process of pulling up a bunch of records, storing them in memory, then grabbing a specific column and placing it into an array. `#pluck` just gives you the resulting array right away:

```ruby
  User.pluck(:name)
  # => ["Foo", "Bar", "Baz", "Jimmy-Bob"]
```

This is another way to help speed up your application if you've found pain points. Start by getting rid of N+1 queries, though.

### Scopes

Scopes are underappreciated, and awesome. A scope is basically a custom chain of ActiveRecord methods that you can slap onto an existing Relation by calling its name like a normal method. It's easiest to see in an example.

Let's say you let your user choose to filter your blog posts only for those marked "important":

```ruby
  # app/models/post.rb
  ...
  scope :important, -> { where(is_important: true) }
  ...

  # app/controllers/posts_controller.rb
  ...
  def index
    if params[:important] == true
      @posts = Post.important.all
    else
      @posts = Post.all
    end
  end
```

Instead of always having to rewrite that chain of ActiveRecord methods when you want them, you can create nicely named scopes to contain all the component logic. You reduce repetition and make your code more readable. The best part is that scopes return Relations... so you can chain as many of them as you want.

You might be thinking, Why use a scope when you can write a class method to do the same thing? You can, as long as your class method returns a Relation (which can take some additional thought for edge cases). In fact, using a class method is often best if your logic chains are quite complicated. The example above could be solved using the following class method as well:

```ruby
  # app/models/post.rb
  ...
  def self.important
    self.where(is_important: true)
  end
  ...
```

See the [Additional Resources section](#additional-resources) for links to some posts that dig a bit deeper into the use cases for these two.

How much do you need to understand or care about scopes? In the early going, you probably won't run into them or see why to use them. Keep them in the back of your mind for when you start working on some slightly more complicated projects that might need them.

### Enums

Enums (short for "enumerations") map a database column, typically an n integer, to a set of symbolic names. They make code more readable and maintainable, and they offer a performance boost since queries involving integers are faster than those involving strings.

Enums are perfect for representing the state of an attribute that has a discrete value. As an example, suppose an article on a blog can be in a `draft` or `published` state. It is never between these two states, and it is never in more than one at any time.

#### How to use enums

To implement `enum`s, we need to declare them in the model and add a column to store them in the database table that stores instances of the model.

Since enums are stored as integers in the database and there is no native `enum` type available in most database schemas, we set their data type to `integer`:

```bash
# If building a new model, pass `column_name:integer` to the model generator
bin/rails g model Article status:integer

# If adding a column to an existing table:
bin/rails g migration AddStatusToLightSwitch status:integer
```

Enums are declared in the model's class as either an array or a hash. The hash flavor has a slight advantage in that the integer values mapped to the `enum` are independent of their position and the values stored in the database are explicitly stated.

```ruby
# Hash declaration (recommended)
class Article < ApplicationRecord
  belongs_to :author
  enum :status, { draft: 0, published: 1 }
end
```

Articles can now be passed a status during creation:

```ruby
article = Article.create(status: :draft)
```

Defining an enum on a model exposes a number of class methods that return collections:

```ruby
Article.draft
Article.not_draft
Article.published
Article.not_published
```

These are functionally equivalent to the following [scopes](#scopes):

```ruby
scope :draft, -> { where(status: "draft") }
scope :not_draft, -> { where.not(status: "draft")}
scope :published, -> { where(status: "published") }
scope :not_published, -> { where.not(status: "published") }
```

A number of handy instance methods are also exposed:

```ruby
# Predicates
article.draft?               #=> true
article.published?           #=> false

# Getters
article.status               #=> "draft"

# Setters
article.status = "published" #=> "published"
article.draft!               #=> "draft"
```

### Bare-metal SQL

Sometimes, you just can't get ActiveRecord to do what you want it to. In that case, it gives you an interface to the bare metal SQL so you can just type in your query as desired. This should really be a last resort -- it's basically hard-coding your application code. Use the `#find_by_sql` method for this.

### Conclusion

This was a lot of material, but you should have a healthy appreciation for the breadth of things that you can do with Active Record. At the most basic level, though, you can do pretty much anything you can in SQL by using Active Record query methods. You'll get a chance to use some of these newfound query methods in future projects and others will come up when you're building things on your own.

### Assignment

<div class="lesson-content__panel" markdown="1">

#### Querying basics

1. Read the first 6 sections of the [Rails Guide on Active Record Querying](http://guides.rubyonrails.org/active_record_querying.html) for a more basic overview of query functions. Don't worry too much about batching and `#find_each`.
1. Read section 20 of the same Rails guide for a brief look at [using `exists?`, `any?` and `many?`](https://guides.rubyonrails.org/active_record_querying.html#existence-of-objects).
1. Read sections 7 and 21 to learn about [grouping and aggregate functions](https://guides.rubyonrails.org/active_record_querying.html#grouping).
1. Skim section 8 to learn about [overriding conditions](https://guides.rubyonrails.org/active_record_querying.html#overriding-conditions).
1. Read section 12 of the same Rails guide to see how Rails lets you play with [joining tables together](https://guides.rubyonrails.org/active_record_querying.html#joining-tables).
1. Read section 18 of the same Rails guide for a quick look at [the helpful `find_or_create_by` methods](https://guides.rubyonrails.org/active_record_querying.html#find-or-build-a-new-object).

#### Advanced querying

1. Read section 14 in the [Rails Guide on Querying](https://guides.rubyonrails.org/active_record_querying.html#scopes) for a look at scopes. Again, you don't necessarily need to memorize all the details of scopes, but you should understand the concept and when it might be useful.
1. Read [How to Use Enums in Rails](https://blog.saeloun.com/2022/01/05/how-to-use-enums-in-rails/).
1. Read section 19 “Finding by SQL” of the same Rails guide for a look at [using SQL directly to query](http://guides.rubyonrails.org/active_record_querying.html#finding-by-sql).

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [How does lazy evaluation help make Active Record more efficient?](#relations-and-lazy-evaluation)
- [How do you check whether a database already contains a record?](#checking-for-existence)
- [What is the difference between a `#where` query and a `#find` query?](#more-assorted-querying-knowledge)
- [How do you join tables together in Rails?](#joins)
- [What is an example of an N+1 query?](#n1-queries-and-eager-loading)
- [What method is used to deal with an N+1 query?](#n1-queries-and-eager-loading)
- [When would you use a class method in place of a scope?](#scopes)
- [When should you consider using enums?](#why-use-enums)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [SO post on Using Scopes vs Class Methods](http://stackoverflow.com/questions/5899765/activerecord-rails-3-scope-vs-class-method)
- [Platformatec diving more into the use case of scopes vs class methods](http://blog.plataformatec.com.br/2013/02/active-record-scopes-vs-class-methods/)
- [RailsCasts #22 Eager Loading](http://railscasts.com/episodes/22-eager-loading-revised)
- [Introduction to the N+1 Problem](https://www.youtube.com/watch?v=Xr3hZdIwuSw)
- [N+1 Problem: Eager Loading with Active Record](https://www.youtube.com/watch?v=wLMRzdOztUY)
- [N+1 Problem: Optimized Counts with Joins and Custom Select](https://www.youtube.com/watch?v=rJg3I-leoo4)
- [Speed up ActiveRecord with a little tweaking](https://blog.codeship.com/speed-up-activerecord/)
- [A useful gem that identifies N+1 queries](https://github.com/flyerhzm/bullet)
- [ActiveRecord::Enum API docs](https://api.rubyonrails.org/classes/ActiveRecord/Enum.html)
