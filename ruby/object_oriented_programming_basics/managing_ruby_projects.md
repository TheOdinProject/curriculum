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

Recall how you've worked with the projects in Foundations: the HTML, CSS and JS all lived in separate files, becoming "one" thanks to linking CSS and JS in the HTML file(s). Being able to divide the type of work across multiple files hopefully organized your work better and prevented confusion. Moving forward you can imagine that your files are only going to get longer and more plentiful in number. Thus, having some kind of structure becomes necessary. Additionally, you might've already realized how useful git tracking changes per-file together with GitHub is by making it a lot easier to track down a bug if you know that your last commit only affected your JS file.

Now, it'd be nice to be able to also divide your Ruby work across multiple files since you're about to set out onto the more complicated OOP projects, where many distinct parts are going to work in unison. Not only is that possible, there are also some conventions around Ruby project structure that aim at making it easier for you and others to work with and navigate your project.

### Making use of multiple files

If you are to split your code across multiple files, you first will need to know how to make sure code from one file can be used in another file. There are two main ways to do that:

- `require_relative` which takes in a string of a relative path, like `require_relative 'lib/bogo_sort'`, is going to look for `lib/bogo_sort.rb` relative to the location of the current file.
- `require` is trickier - there are two ways of using it: one is providing a relative path which is recognized by using `../` or `./` at the start or an absolute path. This works like `require_relative`. Another way is by providing a file name without the extension, like `require 'csv'` is going to look for a `csv.rb` in the Ruby's `$LOAD_PATH` global variable which by default contains the Ruby standard library. There are other file extensions it might look for, but this is not important at this point. In addition to that, if it doesn't find that file in `$LOAD_PATH` it is going to look through installed gems (more on those later) to see if the file is there.

Both of those approaches are going to execute the file, allowing you to use their contents. If you try to require something for the second time, nothing will happen, and the requires will return `false`.

Convention is that `require_relative` is used for your own code, while `require` is used for things outside of it, like gems that your app depend on. Now, there's couple of things that are important to know about requiring files in Ruby. <span id="namespace">First is that all required code is put into the same namespace. This means that if you have the same names for methods, modules, classes and so on they will be added together in order they were required.</span> For example:

```rb
# all files are in the same directory for simplicity's sake

# foo.rb
def foo(bar)
  `#{bar} is awesome!`
end

# footoo.rb
def foo(bar)
  `#{bar} is awful!`
end

# my_cool_project.rb
require_relative 'foo'
require_relative 'footoo'

puts foo('Cereal')
#=> Cereal is awful!
# Since foo is defined twice, the last definition wins out.
```

To make sure code doesn't get overwritten, Rubyists wrap their code in modules which give them the benefits of a namespace:

```rb
# all files are in the same directory for simplicity's sake

# foo.rb
module Foo
  def self.foo(bar)
    `#{bar} is awesome!`
  end
end
# footoo.rb
module Footoo
  def self.foo(bar)
    `#{bar} is awful!`
  end
end
# my_cool_project.rb
require_relative 'foo'
require_relative 'footoo'

puts Foo.foo('Cereal')
#=> Cereal is awesome!
puts Footoo.foo('Marmite')
#=> Marmite is awful!
puts foo('Cereal')
#=> Errors out - there's no longer a free floating foo method to use.
```

Another benefit of this approach is that you don't need to hold all the code for part of your app in one file:

```rb
# This is your file structure:
├── lib
│    ├── foo
│    │    ├── bar.rb
│    │    └── baz.rb
│    └─ foo.rb
└── main.rb

# lib/foo.rb
require_relative 'lib/foo'
require_relative 'lib/foo/bar'
require_relative 'lib/foo/baz'

module Foo
  def self.introduce
    puts "I'm an awesome Foo module!"
  end
end

# lib/foo/bar.rb
module Foo
  module Bar
    def self.introduce
      puts "I'm an awesome Foo::Bar module!"
    end
  end
end

# lib/foo/baz.rb
module Foo
  module Baz
    def self.introduce
      puts "I'm an awesome Foo::Baz module!"
    end
  end
end

# main.rb
require_relative 'lib/foo'

Foo.introduce
#=> I'm an awesome Foo module!
Foo::Bar.introduce
#=> I'm an awesome Foo::Bar module!
Foo::Baz.introduce
#=> I'm an awesome Foo::Baz module!
```

So instead of defining both `module Bar` and `module Baz` inside `foo.rb`, we can do that in separate files and in the end, those two files will make it so our `module Foo` has them for us to use. Note that things that are part of `Foo` are put into a directory matching its name - this is intentional and is supposed to help you figure out the structure of the app. To make it easier to work with your code, it is customary to require all the files in your topmost file, like `foo.rb` here. This allows everyone to just do `require_relative 'foo.rb'` and they get the entirety of your code where they need it.

Another thing to keep in mind is that local variables do not get loaded, so if your `foo.rb` had a local variable `my_favourite_food`, trying to access it in `main.rb` would raise an error. Constants do get loaded however, so you can access those.

### Gems and you

Now that you know how to work with your own files, it is time to learn how to work with the files of others. 

Gems are packages containing Ruby utility libraries that someone wrote - basically, some code. Some of those gems are part of the Ruby standard library, but most require installing independently. 

If you use a gem then you call such a gem a dependency - your code depends on that gem to function properly. Some dependencies are only used in particular contexts; for example, you can have a set of gems used only in a development or test environment. 

Many gems depend upon other gems, and sometimes, the versions they depend on differ. You *could* manage gems and their dependencies on your own, going through the process of installing, updating them and resolving whatever conflicts might arise, but Rubyists have tools for that!

RubyGems has been part of Ruby standard library since version 1.9 and is used to get those amazing gems onto your computer. Remember that bit about `require` going through installed gems to potentially find a file you're looking for? That's the work of RubyGems. Another cool part about it? It is a gem itself! Let's give it a try.

Create a new Ruby file `main.rb` in a directory called `colorful`:

```rb
require 'colorize'

puts 'Red goes faster!'.colorize(:red)

puts "I'm blue da ba dee da ba di!".colorize(:blue)

puts "It ain't easy bein' green...".colorize(:green)
```

You're probably itching to see all those colours, so run your file with `ruby foo.rb` to see them... or rather, a LoadError. Right - you need to <span id="install-gem">install that gem first!</span> Do that with `gem install colorize` and you'll see RubyGems in action. Your system now has access to the `Colorize` gem!

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

```rb
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

<span id="gemfile">There's not much in those but as you can see,</span> the `Gemfile` has information on where to get the gems from and what gems are required. The `"~> 1.1"` is something called a version constraint, particularly one called pessimistic constraint. It relies on semantic versioning - basically, the first number is the major version, second is the minor version and a third, if it exists is the patch number. Major versions can break things from previous versions - think changing method names for example. Minor versions can add and change things but they can't break anything. Patches happen when you introduce bug fixes that don't break anything. So, if people behind a gem maintain it in line with semantic versioning, you can rely on this pessimistic constraint never letting your project have a gem version that could potentially break your app - it is equivalent to `gem "colorize", ">= 1.1", "<2.0"`.

`Gemfile.lock` has information on what was the last environment that should be able to run your app. Bundler will use it to install the same versions of gems even if `Gemfile` could potentially allow for newer versions to be installed.

### .ruby-version

There's another one small bit that is important to give to folks that will run your code: the target Ruby version of your project. You can do it easily by running `rbenv local 3.2.2` as it creates a `.ruby-version` file with the version declared. This is recognized by many other tools to figure out what Ruby version your project is running - for example, `rbenv` will no longer use the `global` Ruby version and the `Ruby LSP` VSCode extension will also change its behavior.

### Ruby LSP in VSCode

Earlier in the curriculum you've been instructed to choose the `Don't show again` option when `Ruby LSP` told you about not finding a lockfile - you might've also seen errors concerning `RuboCop`. In the next lesson we are going to go over `RuboCop` and how it should land in your project's `Gemfile`. After that, you are going to enjoy all the benefits of using `Ruby LSP` and its `RuboCop` integration and your projects are going to be set up like a real pro.

### Assignment

1. Read [Eric Mathison's Understanding require and Friends in Ruby](https://github.com/ericmathison/articles/blob/master/understaning-require-in-ruby.md).
1. Check out the [RubyGems Basics](https://guides.rubygems.org/rubygems-basics/).
1. Skim through [Patterns guide from RubyGems](https://guides.rubygems.org/patterns/), paying closer attention to `Semantic versioning`, `Declaring dependencies` and `Loading code`.
1. Skim through [Bundler's Getting Started](https://bundler.io/guides/getting_started.html#what-is-bundler)and [Frequently Asked Questions](https://bundler.io/guides/faq.html).
1. Check out [Ruby LSP VSCode extension's README](https://github.com/Shopify/vscode-ruby-lsp#ruby-lsp-vs-code-extension).

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- [Why would you split your code across multiple files?](#confusion-convention-convenience)
- [How can you make code from different files available?](#making-use-of-multiple-files)
- [Why would you wrap your code in a module?](#namespace)
- [What are gems?](#gems-and-you)
- [How do you install gems?](#install-gem)
- [What is Bundler used for?](#bundler)
- [Why would you use bundle exec?](#bundle-exec)
- [What are Gemfile and Gemfile.lock for?](#gemfile)

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- [Listen to one of Bundler's maintainers talk about managing dependencies in Ruby](https://www.youtube.com/watch?v=j2V-A8vvLP0) or alternatively, [read the talk](https://andre.arko.net/2015/04/28/how-does-bundler-work-anyway/).
- [More on semantic versioning - perhaps conventional commits will make more sense to you now!](https://semver.org)
- [If you'd like an alternative take on the lesson, Connor Stack's article might be of help](https://medium.com/@connorstack/understanding-ruby-load-require-gems-bundler-and-rails-autoloading-from-the-bottom-up-3b422902ca0).
