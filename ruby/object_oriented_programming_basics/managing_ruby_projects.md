### Introduction

You may have been wondering how programmers structure their projects. Do they just put their entire code in a single file? If they don't, how can they use code across multiple files? Are there agreed-upon rules? Common patterns? What is the Ruby way of doing things?

In this lesson, we will show you how to structure your Ruby projects to keep them manageable and to help you and others easily navigate the code you've written.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- The benefits of splitting your code into separate files.
- How to make use of code from a separate file.
- Namespace and scope of `require`d files.
- What development dependencies are.
- What gems are.
- What Bundler is and why it is useful.
- What `bundle init` does and what a `Gemfile` is.
- How to get the most out of `Ruby LSP` VSCode extension.

### Confusion, convention, convenience

Recall how the projects you worked on in Foundations were structured. The HTML, CSS and JS all lived in separate files and appeared to be "one" in the browser thanks to linking CSS and JS in the HTML file(s).

Organizing your projects into different files has many practical benefits. Chief among them is making your code more modular, making it easier to adjust and understand the code as it gets more complex.

Remember that old saying about how to keep your physical environment organized - "A place for everything and everything in its place". The same principle applies to software projects.

For Ruby projects, the rule of thumbs are:

- One class per file. Every time you create a new class, you should create a new file for it to live in.
- It is convention to put all your Ruby files into a lib directory. For example:

```bash
project_name
├── lib
│   └── lovely_file_of_yours.rb
└── main.rb
```

### Making use of multiple files

If you are to split your code across multiple files, you first will need to know how to make sure code from one file can be used in another file.
Let's consider this file structure:

```bash
├── lib
│   ├── sort
│   │   ├── bogo_sort.rb
│   │   ├── bubble_sort.rb
│   │   └── merge_sort.rb
│   └── sort.rb
└── main.rb
```

There are two main ways to do that: `require_relative` and `require`.

#### require_relative

```ruby
# You're in the root of the project, the directory that holds main.rb

# main.rb
require_relative 'lib/sort'

# sort.rb
require_relative 'sort/bubble_sort'
require_relative 'sort/bogo_sort'
require_relative 'sort/merge_sort'

```

Let's start with how the docs define its functionality:

> require_relative(string) → true or false
  Ruby tries to load the library named `string` relative to the directory containing the requiring file. If the file does not exist a `LoadError` is raised. Returns `true` if the file was loaded and `false` if the file was already loaded before.

The important part here is *relative to the directory containing the requiring file*. This means that no matter where you execute the code from, `require_relative` looks for the file specified from the point of view of the file it has been written in. So `main.rb` is simply going to `lib` to find `sort` (the .rb is implicit), and `sort.rb` is going to `sort` to find those three different sorts. Simple enough, isn't it?

#### require

`require` is trickier. Let's grab *some* of the docs here:
> If the  feature is an  absolute path (e.g.  starts with `'/'`),  the feature
  will  be loaded  directly using  the absolute  path.  If  the feature  is an
  explicit relative  path (e.g.  starts with `'./'`  or `'../'`),  the feature
  will  be  loaded  using  the  relative  path  from  the  current  directory.
  Otherwise,  the feature  will be  searched  for in  the library  directories
  listed in the `$LOAD_PATH`.

The absolute path bit seems self-explanatory. When you use a relative path the difference between using a relative path with `require` and doing `require_relative` is that `require`'s relative paths are resolved from the point of view of the directory you are running your code from. Let's change our example:

```ruby
# You're in the root of the project, the directory that holds main.rb

# main.rb
require 'lib/sort'

# sort.rb
require 'sort/bubble_sort'
require 'sort/bogo_sort'
require 'sort/merge_sort'

```

Ah. Of course - an error - it can't find `lib/sort`! Those are not relative paths... Fancy schmancy `require_relative` and its implicitly assuming the paths are relative!

```ruby
# You're in the root of the project, the directory that holds main.rb

# main.rb
require './lib/sort'

# sort.rb
require './sort/bubble_sort'
require './sort/bogo_sort'
require './sort/merge_sort'
```

Now it says it can't find `./sort/bubble_sort`! This is because it is not looking for it from the point of view of `sort.rb` but from the point of view of `main.rb`.

What about the `$LOAD_PATH` part?

```ruby
# You're in the root of the project, the directory that holds main.rb

# main.rb
require 'csv'

require_relative 'lib/sort'
```

`require 'csv'` is going to look for a `csv.rb` in the Ruby's `$LOAD_PATH` global variable which by default contains the Ruby standard library. There are other file extensions it might look for, but this is not important at this point - just remember that the `require`s look for some extensions like `.rb` without the need to declare them explicitly. In addition to that, if it doesn't find that file in `$LOAD_PATH` it is going to look through installed gems (more on those later) to see if the file is there.

Both of those approaches (`require` and `require_relative`) are going to execute the file, allowing you to use their contents. If you try to require something for the second time, nothing will happen, and the requires will return `false`.

Convention is that `require_relative` is used for your own code, while `require` is used for things outside of it, like gems that your app depend on.

Benefit of this approach is that you don't need to hold all the code for part of your app in one file:

```ruby
# You're in the root of the project, the directory that holds main.rb

# This is your file structure:
├── lib
│    ├── flight.rb
│    ├── hotel.rb
│    └── airport.rb
└── main.rb

# lib/airport.rb
class Airport
  def introduce
    puts "I'm at the airport!"
  end
end

# lib/flight.rb
class Flight
  def introduce
     puts "I'm on the flight!"
  end
end

# lib/hotel.rb
class Hotel
  def introduce
     puts "I'm at the hotel!"
  end
end

# main.rb
require_relative 'lib/airport'
require_relative 'lib/flight'
require_relative 'lib/hotel'

Airport.new.introduce
#=> I'm at the airport!

Flight.new.introduce
#=> I'm on the flight!

Hotel.new.introduce
#=> I'm at the hotel!
```

So instead of defining both the `Flight` and `Hotel` classes inside `airport.rb`, we can do that in separate files. It is customary to require all the files in your topmost file, like `main.rb` here. This allows everyone to just get hold of `main.rb` and they get the entirety of your code where they need it. Depending on their needs, they would use an appropriate way of loading that file.

Another thing to keep in mind is that local variables do not get loaded, so if your `airport.rb` had a local variable `coolest_airports`, trying to access it in `main.rb` would raise an error. Constants do get loaded however, so you can access those.

<span id="namespace">Something important to keep in mind is that all required code is put into the same namespace. This means that if you have the same names for methods, modules, classes and so on they will be added together in order they were required.</span> For example, let's say you and your friend have used the same method name and you're trying to use their code and yours:

```ruby
# all files are in the same directory for simplicity's sake

# not_so_green.rb
def food_opinion(food)
  `#{food} is awesome!`
end

# scheals.rb
def food_opinion(food)
  `#{food} is awful!`
end

# main.rb
require_relative 'not_so_green'
require_relative 'scheals'

puts food_opinion('Cereal')
#=> Cereal is awful!
# Since food_opinion is defined twice, the last definition wins out.
```

To make sure code doesn't get overwritten, Rubyists wrap their code in modules which give them the benefits of a namespace:

```ruby
# all files are in the same directory for simplicity's sake

# not_so_green.rb
module NotSoGreen
  def self.food_opinion(food)
    `#{food} is awesome!`
  end
end
# scheals.rb
module Scheals
  def self.food_opinion(food)
    `#{food} is awful!`
  end
end
# main.rb
require_relative 'not_so_green'
require_relative 'scheals'

puts NotSoGreen.food_opinion('Cereal')
#=> Cereal is awesome!
puts Scheals.food_opinion('Marmite')
#=> Marmite is awful!
puts food_opinion('Cereal')
#=> Errors out - there's no longer a free floating foo method to use.
```

### Gems and you

Now that you know how to work with your own files, it is time to learn how to work with the files of others.

Gems are packages containing Ruby utility libraries that someone wrote - basically, some code. Some of those gems are part of the Ruby standard library, but most require installing independently.

If you use a gem then you call such a gem a dependency - your code depends on that gem to function properly. Some dependencies are only used in particular contexts; for example, you can have a set of gems used only in a development or test environment.

Many gems depend upon other gems, and sometimes, the versions they depend on differ. You *could* manage gems and their dependencies on your own, going through the process of installing, updating them and resolving whatever conflicts might arise, but Rubyists have tools for that!

RubyGems has been part of Ruby standard library since version 1.9 and is used to get those amazing gems onto your computer. Remember that bit about `require` going through installed gems to potentially find a file you're looking for? That's the work of RubyGems. Another cool part about it? It is a gem itself! Let's give it a try.

Create a new Ruby file `main.rb` in a directory called `colorful`:

```ruby
require 'colorize'

puts 'Red goes faster!'.colorize(:red)

puts "I'm blue da ba dee da ba di!".colorize(:blue)

puts "It ain't easy bein' green...".colorize(:green)
```

You're probably itching to see all those colours, so run your file with `ruby main.rb` to see them... or rather, a LoadError. Right - you need to <span id="install-gem">install that gem first!</span> Do that with `gem install colorize` and you'll see RubyGems in action. Your system now has access to the `Colorize` gem!

Wait, *your system* - what about others who would like to use your code? Yeah, they would also need to `gem install` it - no big deal.

But what if you have dozens of gems? How do you ensure that the versions you use are the same version others download? This sounds rather tedious. Enter: Bundler. It's another gem, part of RubyGems, but released independently.

<span id="bundler">Bundler allows you to declare what gems your project needs - down to their version.</span> As for others, Bundler allows them to take that declaration, a simple file called `Gemfile`, and use it to install those gems in a quick `bundle install`.

Since gem installs are global, <span id="bundle-exec">you need a way to run only those particular gem versions that are declared in the `Gemfile`.</span> You can do that by using `bundle exec` followed by a command you want to execute - most likely `bundle exec ruby foo.rb`.

Let's make sure whoever wants to use our script can do so:

```bash
bundle init # creates a default Gemfile in the current working directory
bundle add colorize # adds the colorize gem to the Gemfile and runs bundle install
```

This has created two files: `Gemfile` and `Gemfile.lock`. Let's take a look into both:

```ruby
# Gemfile

# frozen_string_literal: true

source "https://rubygems.org"

# gem "rails"

gem "colorize", "~> 1.1"

# Gemfile.lock
GEM
  remote: https://rubygems.org/
  specs:
    colorize (1.1.0)

PLATFORMS
  ruby
  x86_64-linux # This might be different for you if you're using a different CPU and OS.

DEPENDENCIES
  colorize (~> 1.1)

BUNDLED WITH
   2.5.4
```

<span id="gemfile">There's not much in those, but as you can see,</span> the `Gemfile` has information on where to get the gems from and what gems are required.

The `"~> 1.1"` is a version constraint, particularly a pessimistic constraint. It relies on semantic versioning.

- The first number is the **major** version
- The second is the **minor** version
- the third, if it exists, is the **patch** number

Major versions can break things from previous versions - for example, changing method names. Minor versions can add and change things but can't break anything. Patches happen when you introduce bug fixes that don't break anything.

So, if people behind a gem maintain it in line with semantic versioning, you can rely on this pessimistic constraint never letting your project have a gem version that could potentially break your app - it is equivalent to `gem "colorize", ">= 1.1", "<2.0"`.

`Gemfile.lock` has information on what was the last environment that should be able to run your app. Bundler will use it to install the same versions of gems even if `Gemfile` could potentially allow for newer versions to be installed.

### .ruby-version

There's another important thing to give to folks that will run your code: the target Ruby version of your project. You can do it easily by running `rbenv local 3.2.2` as it creates a `.ruby-version` file with the version declared.

Many other tools recognize this to figure out what Ruby version your project is running - for example, `rbenv` will no longer use the `global` Ruby version and the `Ruby LSP` VSCode extension will also change its behavior.

### Ruby LSP in VSCode

Earlier in the curriculum, you were instructed to choose the `Don't show again` option when `Ruby LSP` told you about not finding a lock file - you might've also seen errors concerning `RuboCop`. In the next lesson, we will review `RuboCop` and how it should land in your project's `Gemfile`.

After that, you will enjoy all the benefits of using `Ruby LSP` and its `RuboCop` integration, and your projects will be set up like a real pro.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read [Eric Mathison's Understanding require and Friends in Ruby](https://github.com/ericmathison/articles/blob/master/understaning-require-in-ruby.md).
1. Check out the [RubyGems Basics](https://guides.rubygems.org/rubygems-basics/).
1. Skim through [Patterns guide from RubyGems](https://guides.rubygems.org/patterns/), paying closer attention to `Semantic versioning`, `Declaring dependencies` and `Loading code`.
1. Skim through [Bundler's Getting Started](https://bundler.io/guides/getting_started.html#what-is-bundler) and [Frequently Asked Questions](https://bundler.io/guides/faq.html).
1. Check out [Ruby LSP VSCode extension's README](https://github.com/Shopify/ruby-lsp/tree/main/vscode#readme).

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Why would you split your code across multiple files?](#confusion-convention-convenience)
- [How can you make code from different files available?](#making-use-of-multiple-files)
- [Why would you wrap your code in a module?](#namespace)
- [What are gems?](#gems-and-you)
- [How do you install gems?](#install-gem)
- [What is Bundler used for?](#bundler)
- [Why would you use bundle exec?](#bundle-exec)
- [What are Gemfile and Gemfile.lock for?](#gemfile)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [Listen to one of Bundler's maintainers talk about managing dependencies in Ruby](https://www.youtube.com/watch?v=j2V-A8vvLP0) or alternatively, [read the talk](https://andre.arko.net/2015/04/28/how-does-bundler-work-anyway/).
- [More on semantic versioning - perhaps conventional commits will make more sense to you now!](https://semver.org)
- [If you'd like an alternative take on the lesson, Connor Stack's article might be of help](https://medium.com/@connorstack/understanding-ruby-load-require-gems-bundler-and-rails-autoloading-from-the-bottom-up-3b422902ca0).
