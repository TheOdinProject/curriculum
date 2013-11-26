# Advanced Active Record

## Introduction

Up until now, we've covered the bread and butter you need to build basic queries using Active Record.  After building a handful of projects and working through the tutorial, you should be comfortable making these queries.

Active Record is much more powerful than just simple CRUD actions on individual records.  It gives you a Ruby-ish interface to do almost anything you can do with bare-metal SQL statements.  You can cherrypick individual groups of records based on specific criteria and order them however you want.  You can join tables manually or query using associations set up by Rails.  You can return lists of records or perform basic math like counts and averages.

All this is done at the database level, which is much faster than loading up a whole table of stuff into Ruby objects before parsing and chopping and calculating with it.

In this lesson, we'll get into the more interesting and useful areas of Active Record.  You'll better understand what Active Record actually returns and how to manipulate the returned values at will.

## Relations and Lazy Evaluation

Using `User.find(1)` will return an unambiguous object -- it's going to find the user with ID = 1 and give it to you as a Ruby object.  But this behavior is actually unusual.  Most queries don't actually return a Ruby object, they just fake it.  For example:

    User.where(:id => 1)

Might look like it returns an array that contains a serialized User object, like:

    [#<User id: 1, email: "foo@bar.com">]

But try running `User.where(:id => 1).class` and you'll see that it isn't an `Array`, it's actually an instance of `ActiveRecord::Relation`.  Relations are actually just really good at looking like arrays but they've got more going on.

Active Record queries return relations to be lazy.  There's basically no reason to actually tell the database to execute a query until the very last possible minute.  What if you never actually needed to use that query at all?  What if you want to make it more complex before executing it?  Relations give you that flexibility and make much more efficient use of your database's valuable time.  

Relations only get executed when it becomes absolutely necessary to know what's inside them.  So if your controller grabs 5 blog posts using `@posts = Post.limit(5)`, that is really passing your view a relation.  It's only when the code in the view actually calls a method on `@posts` (like `@posts.first.title`) that the query will be run and the relation will get stored as a real Ruby object in memory.  

This behavior can be a bit tricky to observe if you use something like the Rails Console (`$ rails console`) to test them out, because the queries will actually be run right away in the console since it implicitly runs something like the `.inspect` method on the relation, which requires the query to be run.  But try playing with building a query like we did above and checking out its `#class`... you'll usually get back `ActiveRecord::Relation`.

### Chaining Queries

Relations aren't just built for speed... they're also built for flexibility.  Let's say you want to grab the first 5 posts listed in ascending order (`Post.limit(5).order(:created_at => :desc)`).  Because `#limit` returns a Relation, `#order` takes that relation and adds its own criteria to it.  You can chain together a dozen methods this way, and, when it's finally time to execute, ActiveRecord and SQL (if that's what you're using for the DB) will figure out the optimal way to structure the query to achieve the desired result.

This is the sort of behavior that you just sort of expect to work, and Relations are what enables it to do so.

### Why Care?

You should care that ActiveRecord queries usually return Relations because you'll run into them often when coding and debugging.  The knowledge should make you comfortable chaining query methods together to construct elaborate queries.

If you end up working with a Relation when you really want it to act like an Array, you can sometimes run `#to_a` on it to force it to evaluate the query.  Common methods which do NOT return Relations and can force evaluation of a relatoin,are `#all` (returns an array of objects) and `#find` (returns a single object).

## More Advanced Querying
chap 1 to 5 of http://guides.rubyonrails.org/active_record_querying.html

find, first, last, find_by
find_each batching


## N + 1 Queries and Eager Loading
Chapter 13 http://guides.rubyonrails.org/active_record_querying.html

## Includes

## Advanced Associations
2.8 through 3.  Skim 4 to see the methods available. http://guides.rubyonrails.org/association_basics.html

## Joins
Chapter 12 http://guides.rubyonrails.org/active_record_querying.html

## Scopes
Chapter 14 http://guides.rubyonrails.org/active_record_querying.html

## Aggregations
chap 6 of http://guides.rubyonrails.org/active_record_querying.html

## Bare-Metal SQL
Chap 17 http://guides.rubyonrails.org/active_record_querying.html

## Callbacks

## Transactions

## Additional Stuff
chaps 7-11 http://guides.rubyonrails.org/active_record_querying.html

Find or build chap 16 http://guides.rubyonrails.org/active_record_querying.html
Existance chap 18 http://guides.rubyonrails.org/active_record_querying.html
Counting and calculations chap 19 http://guides.rubyonrails.org/active_record_querying.html
Chap 20 explaining http://guides.rubyonrails.org/active_record_querying.html

## Your Assignment

* Read [Rails Guides ]

## Conclusion

## Additional Resources