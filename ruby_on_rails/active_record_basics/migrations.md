### Introduction

The term "migrations" might incorrectly lead one to think that the topic of this lesson is data migrations, which refers to the movement of data from one location to another. However, in the context of Rails and this lesson, a "migration" is a *schema* migration, which is the modification of a database's schema without moving it to a new location.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What migrations are.
- When migrations are needed.
- The two main ways to create a migration.
- How to write migrations.
- How to run migrations.
- Why migrations are useful.

### What are migrations?

A Rails migration is a script that sets up or modifies a database's schema in a reversible and re-appliable way. The schema, as you learned in the Databases course, is the structure of your database. Creating and dropping tables, adding and removing columns, as well as certain other modifications, are changes to the schema, whereas adding and removing rows are not. Multiple migration files can be run in sequence like a script. Migrations use schema-altering SQL commands under the hood, similar to how the Model makes SQL queries for you.

### When migrations are needed

Imagine you're staring at a blank computer screen and you need to start your new Rails project. What's the first thing you do? You type `$ rails new MyProjectName` then `cd` into that directory... Then what?

First, figure out the data models that you'll need to use for the first iteration of your site and start getting them set up. For our purposes, we'll just assume all you need is the ubiquitous User model to keep track of all the dozens of users who will be on your site someday (just kidding, you'll hit it big). After you've actually created the database in the first place (using `$ rails db:create`), to create that model you'll need to do two steps:

1. Create a model file in `app/models` which is set up like you just learned above.
1. Create a database table called "users" that has the appropriate columns. This is done using a migration file and then running the migration.

#### Summary

Migrations are needed during the early developmental step of setting up the project's data models, because part of that process involves creating database tables -- a schema alteration. A migration file is therefore required, since in Rails, modifying the schema means creating and then running a migration file.

### How to create a migration file

There are two main ways to create a migration file. The first is to use the model generator `$ rails generate model YourModelNameHere`. The second is to use the migration generator `$ rails generate migration NameYourMigration`.

#### Using the model generator

Migration files can be created by running generators, such as the handy shortcut `$ rails generate model YourModelNameHere`, which not only creates a model file, but a migration file as well. When you type it in, you will see in the Terminal output which files are being created. Don't worry about any specs or test files that also get created, the important ones are the model file and the migration file. Rails has lots of these handy generators which don't do much except create new files in the right spots of your application for you. The output looks something like:

```bash
  invoke  active_record
  create    db/migrate/20131223154310_create_testmodels.rb
  create    app/models/testmodel.rb
  invoke    rspec
  create      spec/models/testmodel_spec.rb
```

The model file that the generator creates is just a bare-bones model file in the `app/models` directory (which you could easily have created yourself). The other main file is the migration file in the `db/migrate` folder, which starts with a complicated looking timestamp like `20130924230504_create_users.rb`. The number is the time that the migration was created so that Rails can keep track of different migration files.

If you dive into that file, you'll see that there's not much in it except another bare-bones Ruby class that inherits from `ActiveRecord::Migration` and some timestamps. The timestamps just create `created_at` and `updated_at` columns for you so you can track when your database records were created or modified. These two columns are just helpful enough that they are included as standard practice.

#### Using the migration generator

If you want to only create the database migration file (without the Model or any of the test files), just use `$ rails generate migration NameYourMigration`. You'll end up using this one more once you've got things up and running since you'll probably be modifying your data table instead of creating a new one. There's a syntax for specifying additional parameters when you call this (which you'll see in the reading), but there's no need to remember that syntax because you can also manually go in and edit the migration file yourself.

### How to write migrations

To add your instructions to the migration file's contents, just add the correct Ruby method to the migration file, like the aptly named `create_table`, and provide its necessary parameters. Now that the migration file has been created and its contents have been written, the next step will be to run the migration.

### How to run migrations

To complete the migration and actually apply the changes to the schema, use the `$ rails db:migrate` command, which runs any migrations that haven’t yet been run. Rails knows if a migration has been run because each migration is a file whose filename has a timestamp in it. When you run that command, Rails will execute the proper SQL code to set up your database table, and you can go back to actually building the website.

### Why migrations are useful

Obviously, migrations let you set up your database using user-friendly Ruby code instead of SQL, but it's more than that. Over time, you'll build up a bunch of these migration files. If you decide that you want to blow away your database and start from scratch, you can do that easily and then rerun the migrations. If you decide to deploy to the web, you will run those same migrations and the production database will be there waiting for you... even if it's a different type of database! Again, Active Record does the heavy lifting for you here so you can focus on building your website.

The most immediately useful feature of migrations is when you've screwed something up because they're (usually) reversible. <span id='rollback-knowledge-check'>Let's say you just migrated to create a new database column but forgot a column to store the user's email... oops! You can just type `$ rails db:rollback` and the last series of migrations that you ran will be reversed and you're back to where you were.</span> Then you just edit the file, rerun the migrations, and move on with your life.

This introduces the last nuance of migrations that we'll talk about here -- reversibility. For each method that you use in the migration, you want to specify how to reverse it if you have to. The reverse of adding a table is dropping that table, of adding a column is removing the column and so on. Many methods have a really obvious reverse case, so you don't need to explicitly state it and can set up the whole migration file using the `change` method. But some of them do not, so you will need to separately specify `up` and `down` methods. You'll read more about that in the assignment.

A final note, you never want to rollback migrations unless you've screwed something up. In situations where you have a legitimate case for removing a column (because you no longer need it for any purpose), you actually create a new migration that removes that column using the `remove_column` method. It preserves the database. Once you get advanced with this stuff, you can build a database just using the schema file... You're not there yet :)

### How much database stuff do we need to know?

Migrations don't involve writing SQL, but you do need to understand enough about databases to know how you want yours structured! Which columns do you want? Which ones should be indexed (and why)? Should you set a default value? What data type will be stored in your column... a string or text?

These are great questions, and you should feel comfortable asking them even if you aren't totally sure about the answers. If you have no idea what we're talking about, you'll need to go back and read up on basic databases in the [Databases course](/paths/full-stack-ruby-on-rails/courses/databases).

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read the [Migrations chapter of Rails Guides](http://guides.rubyonrails.org/active_record_migrations.html).
    - Don't worry about 3.6-3.8.
    - Just skim section 7.
    - Seeds (section 8) are useful and you'll be using them later.  It saves you a lot of work, especially when you're learning and will end up blowing away your database and starting over a lot.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Which rails command will undo a database migration?](#rollback-knowledge-check)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
