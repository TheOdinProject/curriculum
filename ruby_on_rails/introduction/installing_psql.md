### Introduction

One of the great things about the Rails' convention over configuration philosophy is it provides sensible defaults out of the box so that you can get started quickly. However, SQLite is typically not used for production. One major issue is that many hosting providers have ephemeral file systems which means your database can be deleted.

While Rails allows you to use different databases for different environments, it is safer to make sure the application development environment is as close to the production environment as possible. This helps to avoid problems that stem from using different tools in different environments.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What an environment is and how it can impact our application.
- What environment variables are and how to utilize them.
- How to install PostgreSQL and set it up.
- How to set up a bare Rails application to use a specific database.

### Environments and pipelines

In the context of application development, an environment is the collection of tools, configurations and conventions that developers write and run code with. An environment usually consists of an operating system and other software packages on top of that operating system. Some of that software, like `code`, helps write software while others, like `rbenv`, provide tools and configurations to help run software.

There are four basic types of environments that are typically set up together. The application that's being developed will then progress through these environments, which are grouped together in a "production pipeline":

<span id="pipeline"></span>

1. The development environment is typically the developers local machine. Where they can safely make changes, add features and improve the code without impacting actual users.
1. The test environment is set up to facilitate testing of the application. This environment may use different tools and configuration settings (like more verbose logging) to validate a program's behavior and identify bugs with automated tests.
1. The staging environment usually mirrors the production environment but deployments are not meant to be public.
1. The production environment runs the application so that it is accessible by users.

Because an environment is a collection of tools and configurations, they come in handy as a place to store secrets or other information that may change based on the application's intended use.

For example, the local database server might have different credentials than the production database or maybe there are more analytics and logging requirements for production deployment.

As applications get larger, setting up these different environments can help developers deliver their best work while making sure changes (or bugs) don't negatively affect users.

### Environment variables

<span id="env_var">The foundation of any environment is the operating system, which provides ways to store local variables. Not surprisingly, these are known as environment variables.</span>

Why are environment variables important? After all, the information could be added to the git repository (and by extension Github). While tools like git and Github are excellent for storing, versioning and sharing code; sensitive information like API keys or passwords should be kept private. Even if you remove the private data from the current commit, it may still live on in the commit history!

<span id="privacy">Environment variables allow us to set this information where the application will run without sharing it on git or Github. Because these variables can only be accessed locally, our application can access these sensitive values without making them public.</span>

Rails uses the environment to set up its own internal environment variable. The framework will look for a `RAILS_ENV` variable in the environment and set its own env that way. If it can't find the variable, then [Rails will assume it is in a development environment](https://github.com/rails/rails/blob/main/railties/lib/rails.rb#L69-L77). Isn't that cool?

We will use an environment variable to set up PostgreSQL credentials for our Rails apps.

### Assignment

<div class="lesson-content__panel" markdown="1">

#### Install PostgreSQL

1. Depending on the OS you are running, follow the appropriate PostgreSQL installation guide below:
   - [Linux](https://github.com/TheOdinProject/curriculum/tree/main/ruby_on_rails/introduction/installation_guides/postgresql/linux.md "PostgreSQL installation for Linux")
   - [MacOS](https://github.com/TheOdinProject/curriculum/tree/main/ruby_on_rails/introduction/installation_guides/postgresql/macos.md "PostgreSQL installation for MacOS")

#### Creating a Rails application backed by PostgreSQL

Now that we've installed and configured our local PostgreSQL server, let's generate a new Rails application to make sure everything is working.

1. Through the curriculum to this point, Rails has been using the `sqlite` gem in order to run and manage its database. As we just set up PostgreSQL, we will need to install the companion gem so that Rails knows how to interact with this database provider:

   ```bash
   gem install pg
   ```

   We are already familiar with `rails new <app_name>` but it is also possible to specify the database that Rails should use when generating a new application. Since we just installed PostgreSQL, let's try it out!

   Navigate to where you keep your projects and run:

   ```bash
   rails new <app_name> --database=postgresql
   ```

1. Let's navigate into the app directory and set up our database credentials.

   ```bash
   cd <app_name>
   ```

   Once we're inside the right directory, we can set up the database username and password in `config/database.yml` by adding entries with our information:

   ```diff
   default: &default
     adapter: postgresql
     encoding: unicode
     # For details on connection pooling, see Rails configuration guide
     # http://guides.rubyonrails.org/configuring.html#database-pooling
     pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
   +  username: <role_name> # role previously added
   +  password: <%= ENV['DATABASE_PASSWORD'] %> # variable previously added
   # You must remove the '+' signs to be able to migrate your database
   ```

   Save the file, and we can see Rails work its magic:

   ```bash
   rails db:create
   ```

   Rails should create the two databases, and as a final check we can start the Rails server:

   ```bash
   rails s
   ```

   Open your browser, and head on over to `localhost:3000`. If you are greeted by the Rails splash page, then we did it! If you see an error, come to [our Discord server](https://discord.gg/fbFCkYabZB) and get some help!

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What are the typical environments that make up a pipeline?](#pipeline)
- [What is an environment variable?](#env_var)
- [Why should we use environment variables?](#privacy)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- RubyGuides has a good [introduction to environment variables](https://www.rubyguides.com/2019/01/ruby-environment-variables/) that has a lot of information, including some gem options for managing environment variables.
- DigitalOcean has a fantastic [guide to setting up PostgreSQL](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-22-04) that you can also check out.
