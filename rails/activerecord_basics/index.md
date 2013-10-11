# Active Record

validations, associations, queries, validation errors / is_valid?... thinking data-first??? The important skill is knowing data structure of a problem first, then worrying about the rest.

## Introduction

Presumably you're here to learn web development (otherwise... you may be in the wrong place...).  Whether your goal is to be able to produce your own website or to begin a career as a developer, the most important skillset to take away from all this is the ability to think logically and to break down a problem into its component pieces.  Then you can address those pieces one at a time.  It's the essence of engineering.

Probably the most important way that logical thinking is required when building a website is in setting up your data model properly.  Data is the foundation of almost all major web applications, from a simple blog site to Facebook's massively complex web of data.  Having an obscure or overly complex data model can cripple you when you try to grow and make your life as a developer exceedingly painful.  If you're working with the wrong tools, something "simple" like asking to display all the comments a user has made on another user's web posts can take up far too many brain and CPU cycles to accomplish.

If data is the most important piece of a web application, then how Rails handles data should be very interesting to you.  Luckily, this is one of the most significant reasons that Rails has performed so well compared with the options available just a few years ago.  Active Record is the interface that Rails gives you between the database and your application.  It lets you structure your data models for your users, blog posts, comments, followers, etc. in a logical and nearly plain-english way.  If it seems complicated (which it will at points), just think of life before Active Record.

Having a solid understanding of Active Record will make the rest of Rails seem simple by comparison.  Remember that we previously learned that the Model in MVC is the part that does all the heavy lifting.  

What is Active Record anyway?  Recall that Rails is actually seven main Ruby gems that work harmoniously together.  Active Record is, to put it inelegantly, the gem that takes care of all the data stuff.  It's known as an "ORM".

## What is an ORM?

ORM stands for Object-Relational-Mapping.  It basically means that Active Record takes data which is stored in a database table using rows and columns, which needs to be modified or retrieved by writing SQL statements (if you're using a SQL database), and it lets you interact with that data as though it was a normal Ruby object.  

So if I want to get an array containing a listing of all the users, instead of writing code to initiate a connection to the database, then doing some sort of `SELECT * FROM users` query, and converting those results into an array, I can just type `User.all` and Active Record gives me that array filled with User objects that I can play with as I'd like.  Wow!  

Even more impressive, it doesn't really matter which type of database you're using (as long as you've set up the `config/database.yml` file properly), Active Record smooths out all the differences between those databases for you so you don't have to think about it.  You focus on writing code for your application, and Active Record will think about the nitty gritty details of connecting you to your database.  It also means that if you switch from one database to another, you don't actually need to change any major application code, just som configuration files.  Sounds logical, right?

## Rails Models

That's a step ahead of ourselves, though, because first it makes sense to think about what the relationship is between Rails and a database anyway.  It's actually pretty straightforward -- you want to store information about your users, so you create a database table called `users`.  You want to be able to access that data from your application, so you create a model called `User`, which is really just a Ruby file which inherits from Active Record and thus gets to use all the handy methods I was alluding to earlier like `all` and `find` and `create`.  One table == one model which inherits from Active Record.

## Your Assignment

That was really just a teaser about what Active Record can do.  In the reading below, you'll learn about how to specifically interact with Active Record in your models.  

1. I'm assuming that you've already read and followed along with the example application that was created in the [Getting Started with Rails](http://guides.rubyonrails.org/getting_started.html) intro section of the Rails Guides.  If you haven't, do that first!
2. Read the [Active Record Basics](http://guides.rubyonrails.org/active_record_basics.html) section of the Rails Guides.  

    * We'll go more into Migrations and Validations in the next section and Callbacks later in the course.
    * Model files in Rails live in the `app/models` folder and are just normal .rb files.  The key points are that the file is named after the table in your database, the class name is the same (but singular), and that class inherits from ActiveRecord::Base to get its super powers.

## Migrations

Imagine you're starting fresh with a project and need to get your database up and going...
http://guides.rubyonrails.org/migrations.html

## Basic Validations

Imagine you've got your database up and running and want to make sure that the data people are sending to your database is good data...

http://guides.rubyonrails.org/active_record_validations.html

## Basic Associations

Imagine you've got a simple data model like a User but now you want that User to relate to other things like maybe his Profile or every Post he has authored on your blog.

http://guides.rubyonrails.org/association_basics.html