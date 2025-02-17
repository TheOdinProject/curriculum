### Introduction

Presumably you're here to learn web development (otherwise... you may be in the wrong place...). Whether your goal is to be able to produce your own website or to begin a career as a developer, the most important skillset to take away from all this is the ability to think logically and to break down a problem into its component pieces. Then you can address those pieces one at a time. It's the essence of engineering.

Probably the most important way that logical thinking is required when building a website is in setting up your data model properly. Data is the foundation of almost all major web applications, from a basic blog site to Facebook's massively complex web of data. Having an obscure or overly complex data model can cripple you when you try to grow and make your life as a developer exceedingly painful. If you're working with the wrong tools, something simple like asking to display all the comments a user has made on another user's web posts can take up far too many brain and CPU cycles to accomplish.

If data is the most important piece of a web application, then how Rails handles data should be very interesting to you. Luckily, this is one of the most significant reasons that Rails has performed so well compared with the options available just a few years ago. Active Record is the interface that Rails gives you between the database and your application. It lets you structure your data models for your users, blog posts, comments, followers, etc. in a logical and nearly plain-English way. If it seems complicated (which it will at points), just imagine life before Active Record.

Having a solid understanding of Active Record will make the rest of Rails seem simple by comparison. Recall from several lessons ago that the Model in MVC is the part that does all the heavy lifting. In this lesson, we'll cover all the basics of working with models. As usual, this explanation is meant to be a high-level overview and the readings will provide real depth. The more advanced topics will be covered in some of the coming lessons.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What an ORM is.
- How and why Active Record can be more useful than just using SQL.
- The two steps required to make a new row in your database table with Active Record.
- "Generators" in Rails.

### What is an ORM?

What is Active Record anyway? Recall that Rails is actually seven Ruby gems that work harmoniously together. Active Record is, to put it inelegantly, the gem that takes care of all the database stuff. It's known as an "ORM".

ORM stands for Object-Relational-Mapping. It basically means that Active Record takes data which is stored in a database table using rows and columns, which needs to be modified or retrieved by writing SQL statements (if you're using a SQL database), and it lets you interact with that data as though it was a normal Ruby object.

So if you want to get an array containing a listing of all the users, instead of writing code to initiate a connection to the database, then doing some sort of `SELECT * FROM users` query, and converting those results into an array, you can just type `User.all` and Active Record gives us that array filled with User objects that we can play with as we like. Wow!

Even more impressive, it doesn't really matter which type of database you're using (as long as you've set up the `config/database.yml` file properly), Active Record smooths out all the differences between those databases for you so you don't have to think about it. You focus on writing code for your application, and Active Record will think about the nitty gritty details of connecting you to your database. It also means that if you switch from one database to another, you don't actually need to change any major application code, just some configuration files. Sounds logical, right?

### Rails models

That's a step ahead of ourselves, though, because first it makes sense to think about what the relationship is between Rails and a database anyway. It's actually pretty straightforward -- you want to store information about your users, so you create a database table called `users`. You want to be able to access that data from your application, so you create a model called `User`, which is really just a Ruby file which inherits from Active Record and thus gets to use all the handy methods we were alluding to earlier like `all` and `find` and `create`. One table corresponds with one model which inherits from Active Record.

#### 30 seconds about working with models

Very briefly, Active Record lets you create a Ruby object that represents a row in one of your database tables, like a `User`. To create a new User is a two-step process: First, you'll need to do a `User.new` and might pass it a hash full of its attributes like

```bash
u = User.new(name: "Sven", email: "sven@theodinproject.com")
```

If you don't pass a hash, you'll need to manually add the attributes by setting them like with any other Ruby object: `u.name = "Sven"`. The second step is to actually save that model instance into the database. Until now, it's just been sitting in memory and evaporates if you don't do anything with it. To save, call `u.save`. You can run both steps at once using the `#create` method:

```bash
u = User.create(name: "Sven", email: "sven@theodinproject.com")
```

This saves you time, but, as you'll see later, you'll sometimes want to separate them in your application.

### Assignment

That was really just a teaser about what Active Record can do. In the reading below, you'll learn about how to specifically interact with Active Record in your models and go deeper into the other topics covered.

<div class="lesson-content__panel" markdown="1">

1. Read the [Active Record Basics](http://guides.rubyonrails.org/active_record_basics.html) section of the Rails Guides.
    - We'll go more into Migrations and Validations in the next lessons and in the lesson on Callbacks later in the course.
    - Model files in Rails live in the `app/models` folder and are just normal .rb files. The key points are that the file and the class name is named after the table in your database (but singular), and that class inherits from ApplicationRecord to get its super powers.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Should Active Record model classes be singular or plural?](https://guides.rubyonrails.org/active_record_basics.html#naming-conventions)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [Schneems on database backed models with Active Record](https://www.youtube.com/watch?v=EU98yHB-_7A).
