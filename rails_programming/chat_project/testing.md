### Testing

Writing tests gives us the confidence that our application works as intended without having to load up the app and run every possible scenario ourselves which would be time consuming and error prone. Automated tests allow us to develop new features rapidly safe in the knowledge they haven't broken any of our application's functionality.

We will be using the popular Ruby testing library RSpec for our application and we'll be writing tests as we go.

RSpec provides an [rspec-rails](https://github.com/rspec/rspec-rails) gem with easy to follow instructions.

To set this up we need to open up the Gemfile in whatever editor you use and find the development and testing part of the Gemfile. It should look like this.

```ruby
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end
```

Within that group just underneath the line with `gem 'byebug'` on add the following line:

```ruby
gem 'rspec-rails', '~> 4.0.0'
```

It's a good idea when adding gems to give them a version you want to use. In our case we specified `~> 4.0.0` which tells bundler to install the rspec-rails gem that is greater than version 4.0.0 but less than version 4.1. This allows us to update our gems incrementally as different versions can introduce breaking changes.

Make sure you have saved the Gemfile and then in the terminal run

```ruby
bundle install
```

This will install the gem to our project.

rspec-rails comes with a generator to install all of the files we will need.

Again in the terminal run

```ruby
rails generate rspec:install
```
