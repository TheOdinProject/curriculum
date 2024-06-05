### Introduction

Code. Code is written for our machines to execute but more importantly it is written for us, humans, to understand.

You've seen some code by now, especially so if you were diligent and took the time to practice reading code by exploring projects written
by your peers going through The Odin Project. Some of it was good, some of it was bad but probably a lot of it was just confusing.
That's absolutely fine, of course - you're all still learning.

But what do professionals do to make sure their code is as best as it can be:
readable, predictable and performant? They try to come up with best practices. How do they enforce them?

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What linting and formatting are.
- Where RuboCop takes its various rules from and how one could group them.
- How to install and configure RuboCop.
- How RuboCop interacts with RubyLSP and VSCode.
- What cyclomatic complexity and ABC metrics are.

### Convention time again

You have already been exposed to some of the conventions in HTML, CSS, JS and Ruby.
This is why JS has its variables written `likeThis` while Ruby's are `like_this`, why functions are verbs and variables are things like `do_something(with_thing, another_thing)`. Why there exists
a preference for getting rid of `if` statements, why some languages prefer loops while other prefer iterative approaches. Why some features
present in languages are strongly discouraged - remember `var`, `eval()` or `$global_variable`s?

There's *a lot* more of these relating to features of Ruby (or a different language!) that you might never even have heard of. <span id='style-guide'>The good news is that there exist style guides:</span>
a set of standards for writing and organizing code. The bad news? Your head would need to store that entire set of standards and be able to recall them whenever working with code.

### Your code has pockets, too

Enter another set of tools: linters and formatters. Those do the remembering job for you - they shall point out that something's wrong. Perhaps they might automatically fix
some of the issues or at least provide hints or references to the style guide that might help you in writing cleaner code.

<span id='formatting'>Formatting is all about making your code look neat and tidy without changing code's behavior - think indentation and various spacing, so style.</span> <span id='linting'>Linting is all about making your code easier to reason about - this might change how your code behaves, for example by enforcing that you use `#each` instead of a `for` loop.</span> For all that, Rubyists have a powerful ally:

RuboCop. A really polished Gem that will make your code shine!

Before you and RuboCop do a check-up on your Caesar Cipher project, let's talk some more about the Ruby Style Guide, starting with how it introduces itself:
> This Ruby style guide recommends best practices so that real-world Ruby programmers can write code that can be maintained by other real-world Ruby programmers. A style guide that reflects real-world usage gets used, while a style guide that holds to an ideal that has been rejected by the people it is supposed to help risks not getting used at all - no matter how good it is. (...)
 The guidelines provided here are intended to improve the readability of code and make it consistent across the wide spectrum of Ruby code.

As you can see, those are *recommendations* dictated by real-world usage aimed at improving readability and consistency of Ruby code. In the end, it is like the difference between how you send your messages online versus how you'd write an essay. One is about communicating quickly, the other is about communicating clearly.

The various conventions can be grouped based on what aspects of your code they deal with. As a starting point, lets use some of RuboCop's departments - Style, Lint and Metrics. Perhaps you've anticipated that RuboCop doesn't work alone - it indeed has a whole precinct behind itself. The various Cops are interested in making sure that some particular rule is not broken. Let the departments speak for themselves:

> Style Cops check for stylistic consistency of your code. Many of the them are based on the Ruby Style Guide.
>
> Lint Cops check for ambiguities and possible errors in your code.
>
> Metrics Cops deal with properties of the source code that can be measured, such as class length, method length, etc.

You'll have an opportunity to dig into particulars of the Ruby Style Guide soon and as for the Cops - they'll make sure to make themselves known. On that note, let's begin the investigation, detective!

### Section where you learn all about code crime

<span id="install-rubocop">As mentioned earlier, RuboCop is a Gem and the project we want to investigate is Caesar Cipher. Go back and install RuboCop locally (as in, use Bundler)</span> and <span id="cli-rubocop">then run `bundle exec rubocop` in your terminal.</span> Running it like this makes sure that the local version of RuboCop is used and it will check all the files in the current working directory *and* its subdirectories. In short: everything.

Whoa! Well, at least for me - perhaps you're a savant and a Ruby Style natural, in that case, here's some example output:

```bash
Inspecting 2 files
CC

Offenses:

Gemfile:3:8: C: [Correctable] Style/StringLiterals: Prefer single-quoted strings when you don\'t need string interpolation or special symbols.
source "https://rubygems.org"
       ^^^^^^^^^^^^^^^^^^^^^^
caesars_cipher.rb:1:1: C: [Correctable] Style/FrozenStringLiteralComment: Missing frozen string literal comment.
def caesar_cipher(string, shift_factor)
^
caesars_cipher.rb:3:5: C: [Correctable] Layout/EmptyLineAfterGuardClause: Add empty line after guard clause.
    return string if shift_factor.remainder(26) == 0
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
caesars_cipher.rb:3:22: C: [Correctable] Style/NumericPredicate: Use shift_factor.remainder(26).zero? instead of shift_factor.remainder(26) == 0.
    return string if shift_factor.remainder(26) == 0
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
caesars_cipher.rb:15:5: C: [Correctable] Style/RedundantReturn: Redundant return detected.
    return character
    ^^^^^^
caesars_cipher.rb:16:8: C: [Correctable] Style/StringLiterals: Prefer single-quoted strings when you don\'t need string interpolation or special symbols.
  when "z"
       ^^^

2 files inspected, 19 offenses detected, 19 offenses autocorrectable

# Duplicate offenses in the same file were truncated.
```

<span id="output-rubocop">Let's break this down.
The output starts with telling how many files are to be inspected:</span>

```bash
Inspecting 2 files
```

Then, a somewhat mysterious string of capital letters appeared: `CC`:

```bash
CC
```

Every letter corresponds to one file. So both of the files inspected by RuboCop reported "convention" as their most severe issues.
The other letters that you might want to know are `W` for warning and `F` for fatal.
Finally, the output arrives at the crime scene - offenses:

```bash
Offenses:

Gemfile:3:8: C: [Correctable] Style/StringLiterals: Prefer single-quoted strings when you don\'t need string interpolation or special symbols.
source "https://rubygems.org"
       ^^^^^^^^^^^^^^^^^^^^^^
```

The output resembles stack traces a little bit: you get the file, the line and the column, then severity level letter. After that you receive information on whether
RuboCop can fix the problem on its own. We'll get back to this very soon. Further, you learn of the Department/Cop - in this case, you're dealing with StringLiterals Cop from the Style department.
Obviously, our cybernetic assistants are polite enough to introduce themselves, so you're being told what is wrong. Finally, you are directly told what and where is the offending part of code.
Here, RuboCop pointed out that this string could very well be single-quoted, as that string doesn't use anything that comes with double-quoted strings.

You could ask why such a foundational Gem as Bundler can run into trouble with the law. The answer is that RuboCop is highly customizable to accommodate many standards that programmers
might have. Remember: what is important in linting and formatting is making sure everyone in a group plays by the same rules, so the code is more readable.

Before you unleash the automated fury of RuboCop upon your code, you might want to become acquainted with a nifty flag: `-S`. This will provide a link to the Ruby Style Guide
that goes over the rationale for the offense, if the Cop has such link when `bundle exec rubocop -S` is used:

```bash
Gemfile:3:8: C: [Correctable] Style/StringLiterals: Prefer single-quoted strings when you don\'t need string interpolation or special symbols. (https://rubystyle.guide#consistent-string-literals)
source "https://rubygems.org"
       ^^^^^^^^^^^^^^^^^^^^^^
```

Nifty, eh?

But I hear you - you're here for action. So let's go for the `-a` flag, a for action! (Actually, it stands for autocorrect but that's not as fun) `bundle exec rubocop -a`, go!

```bash
Inspecting 2 files
.C

Offenses:

caesars_cipher.rb:1:1: C: [Correctable] Style/FrozenStringLiteralComment: Missing frozen string literal comment.
def caesar_cipher(string, shift_factor)
^
caesars_cipher.rb:3:5: C: [Corrected] Layout/EmptyLineAfterGuardClause: Add empty line after guard clause.
    return string if shift_factor.remainder(26) == 0
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
caesars_cipher.rb:3:22: C: [Correctable] Style/NumericPredicate: Use shift_factor.remainder(26).zero? instead of shift_factor.remainder(26) == 0.
    return string if shift_factor.remainder(26) == 0
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
caesars_cipher.rb:15:5: C: [Corrected] Style/RedundantReturn: Redundant return detected.
    return character
    ^^^^^^
caesars_cipher.rb:16:8: C: [Corrected] Style/StringLiterals: Prefer single-quoted strings when you don\'t need string interpolation or special symbols.
  when "z"
       ^^^

2 files inspected, 16 offenses detected, 14 offenses corrected, 2 more offenses can be corrected with rubocop -A
# Duplicate offenses were truncated.
```

See that `.`? That means the first file is now all fine and dandy! Some of the offenses were not corrected by RuboCop and that's because `-a` is for safe autocorrect.
If you wanted to go through with the `[Correctable]` offenses, you'd want to use `-A` as the output helpfully suggests. This is due to the fact that some Cops are safe, some are unsafe.

The safe Cops promise that they won't have false positives and that their autocorrect won't change the semantics of the code and it will be fully equivalent to what you had written.

From this it follows that unsafe Cops either have false positives or slightly change the semantics of the code. The first characteristic means they tell you something is wrong when actually, everything is alright - for example, you've got a method with the same name as one in standard library in your object and RuboCop treats it as if it were the standard library method.

The latter means that while your code and the proposed code arrive at the same output, they might change how (but not what) the output is achieved or produce a side-effect that might even break your code.

### You are the code dictator

Due to Ruby's ecosystem, <span id="configure-rubocop">RuboCop was built with extensive configurability in mind - both in terms of not using some parts of and in terms of adding onto it.</span> Every single Cop can be disabled, sometimes Cops offer alternative rules like preferring single- or double-quotes for Strings, you can disable Cops on a per-file basis and much more.

Since RuboCop is extensible, there exist other departments that you can use - like Performance or RSpec. You could even write your own Cop! The process of adding an extension is easy: you install the Gem locally and modify `.rubocop.yml`.

Usually things that are not required for app to run are given the `require: false` flag, like:

```bash
`gem 'rubocop-performance', require: false`
```

This way the Gem would be installed normally, but for your `bundle exec` ran code to make use of it, it would need to be explicitly `require`d wherever you'd need it.

`.rubocop.yml` is the configuration file for RuboCop and it lives in the root directory of your project. There you'll change the defaults of RuboCop to your (or most likely, your team's) liking. To create such config file, you can just use `bundle exec rubocop --init` - it won't have anything in it besides a comment describing what it is for but if we were to add the Performance extension, we'd need to throw `require: rubocop-performance` in there so RuboCop knows to run it.

RuboCop is still under development, so changes and additions happen. New Cops join the precinct and they're not enabled by default - if you'd like them to be enabled by default instead of going through all of them and deciding on your own, you can use:

```bash
AllCops:
  NewCops: enable
```

in your `.rubocop.yml` to enable all the new Cops.

### Power corrupts

Perhaps you're not interested in tailoring RuboCop to your liking, especially since you're just starting out and have absolutely no idea what's good and what's bad. That'd be the correct approach - don't worry about it right now and just go with the RuboCop defaults.

<span id="importance-metrics">One of the departments you might be tempted to drop is Metrics. It probably is going to be your worst enemy starting out in writing bigger, more object oriented code. But being that worst enemy has good reasons: it tries to help you write better code. It is fine if you can't always satisfy RuboCop but to shun its guidance during learning is foolish.</span>

Having said that, seeing those offenses come up again and again in one place that you've already made peace with being non-compliant is distracting. Since you don't want to disable those Cops altogether, you can use inline comments to turn off what pesters you:

```ruby
# rubocop: disable Metrics/AbcSize
def some_convoluted_method(it_really, is_convoluted)
    # with convoluted code...
end
# rubocop: enable Metrics/AbcSize
```

This will disable the `AbcSize` Cop from `Metrics` department between those comment lines. Remember: don't use this to avoid working on your code, use it whenever appropriate - it might really be the case that some method has to be that complicated, or at least that's the current belief.

Some rules are a lot more arbitrary - the Style department is going to be the prime ground for strong arguments about things that don't really matter - like double-quoting all strings vs making a distinction between plain strings and string interpolation. Perhaps you have strong feelings about quotes, so let's help you out by showing you how to show them to RuboCop.

Start by running `bundle exec rubocop --init` in your home directory to generate a blank `rubocop.yml` file. It has a comment that describes how to use it but besides that - it's totally empty!
Now, you need to find out what rule you want to change or disable. For the possible options always consult the documentation - not every Cop is just a simple on/off, there might be more options. As an example, we'll be changing the rules regarding strings, frozen string literals and we'll enable NewCops.

```yaml
# This is .rubocop.yml in ~/
AllCops:
  NewCops: enable

Style/StringLiterals:
  EnforcedStyle: double_quotes

Style/FrozenStringLiteralComment:
  EnforcedStyle: never
```

Placement of `.rubocop.yml` in `~` is not accidental - if RuboCop can't find a config file anywhere in the project, it'll look for it in couple of more places, one of them being your home directory. This config file will make it so every project without own configuration will follow these rules - NewCops being enabled, string literals all being double-quoted and not allowing for a magic comment enabling or disabling frozen string literals - this last thing will make sense after you work with RuboCop for a while.

But what with your projects that want to use *some* of the general configuration but not all of it? Enter: `inherit_from`. By adding a line with `inherit_from ~/.rubocop.yml` into your local `.rubocop.yml` makes it use the same rules as defined there. You can then overwrite them locally. Neater thing? You can have directory-specific `.rubocop.yml`s that inherit from your project specific configuration file just to make sure every file in that directory is or is not following some rules. Let's see an example:

```yaml
# This is .rubocop.yml in ~/my-cool-project/

inherit_from ~/.rubocop.yml

Style/StringLiterals:
  EnforcedStyle: single_quotes

Style/FrozenStringLiteralComment:
  EnforcedStyle: always
```

And now you are back to single-quoting and always having a magic comment regarding frozen string literals. Word of caution: if you rely on such global configuration you might forget to include it with your project. It would make sense that people who are going to work on the project follow the rules that it has been created in mind with.

Defaults are absolutely fine, however. No need to tinker with anything. With time you'll see what rules give you and when it makes sense to break them. Actually, there's an amazing talk about that in the assignment so if you're not yet convinced, just hold your horses for a moment!

So, try your best to deal with RuboCop but accept that your code won't be perfect. That's fine. Resist the temptation to stray away from the defaults. You're still learning - just make an honest attempt to make your code better. Perhaps reading other's code is going to show you the way, so always remember to spend some time reading code after finishing a project!

### Metrics are useless if not understood

Our recommendation to stick to the Metrics department requires that we help with explaining the more confusing concepts employed there: ABC metric, cyclomatic complexity and perceived complexity.

<span id="abc">The letters in ABC are not random, they stand for **A**ssignment, **B**ranches and **C**onditionals. Assignment deals with setting or mutating a variable, branches perhaps confusingly, refer to method calls and conditionals are both the usual various conditional statements and comparisons like `==` or `<=`.</span>

ABC's author said that it measures software size and it was created to quote: "overcome the disadvantages of lines of code and similar measures". Yep, there was a time when code length, not its complexity was the measure of good software.

Besides notifying you about going over the allowed value for the metric, RuboCop will also provide you with the total ABC score and its constituent parts:

```bash
C: Metrics/AbcSize: Assignment Branch Condition size for testing is too high. \[\<1, 18, 0\> 18.03/17\]
```

In this case, there is one assignment, eighteen branches and zero conditionals, after using the formula for calculating the score this ends up being 18.03 while the allowed score is 17.

One way to interpret this particular score is to say that this method heavily relies on other methods to do something with data. Perhaps this process could be broken down into steps or there exists some design flaw that requires us to manipulate the data so much in this one place.

<span id="cyclomatic">Cyclomatic complexity is similar to the conditional measure in ABC. It aims at providing insight into how complex a program based on how many possible paths can the program (method) can go through. As you can imagine, this refers to control flow statements like if statements, loops and logical operators like `&&` or `||`.</span>

Of course in the Ruby context, instead of loops you are most likely going to use methods like `#each` to iterate over your collections - that counts, too. Every time code execution and follow one or the other path, one gets added to the score.

<span id="perceived">Perceived complexity is very similar to cyclomatic complexity. It attempts to measure how hard it is for a human to read the code and where it diverges from cyclomatic complexity is that it uses weights for some control flow statements and counts both `if` and `else` instead of just the if statement as one branching path.

### Wouldn't it be nice to have all this in VSC?

<span id="vscode-rubocop">It certainly would! Thanks to Ruby-LSP, RuboCop is integrated with Visual Studio Code. All you need is a Gemfile set up with RuboCop in your project. Thanks to this, RuboCop is continuously ran while you're writing your code, providing you with feedback on the go:</span>

![Caesar's Cipher project in VSC with many problems](https://cdn.statically.io/gh/TheOdinProject/curriculum/270b3d2430621d1d768234d53588054dc4bdda13/ruby/object_oriented_programming_basics/linting_and_rubocop/imgs/rubocopinvsc.png)

You've got the underlines and neatly formatted list of issues listed in the `Problems` tab. Remember that `Problems` tab is interactive - make sure to play with it!

When you hover over an underlined piece of code, you will be informed of the offense and be given links to RuboCop documentation *not* the Ruby Style guide and also given shortcuts to `View Problems` and `Quickfix`:

![VSC pop-up after you hover on an offense](https://cdn.statically.io/gh/TheOdinProject/curriculum/270b3d2430621d1d768234d53588054dc4bdda13/ruby/object_oriented_programming_basics/linting_and_rubocop/imgs/rubohover.png)

Quickfixes are pretty much `rubocop -a` but confined to a particular line. Take note that from here you can also disable and enable the Cop behind the offense:

![VSC quickfix pop-up](https://cdn.statically.io/gh/TheOdinProject/curriculum/270b3d2430621d1d768234d53588054dc4bdda13/ruby/object_oriented_programming_basics/linting_and_rubocop/imgs/quickfixrubocop.png)

### To write good code you need to write a lot of bad code first

You might be wondering why when you were installing Ruby you weren't told about Rubocop. If writing clean code is the goal, why not start out with a formatter and a linter? Why not go into a style guide right off the bat?

The reasons for this are many, but some of them would be:

- If you were to learn about the style guide only, you would have no idea what it is referring to or your lack of experience with Ruby would prevent you from understanding the pros and cons.
- Had RuboCop been with you all this journey you'd never be able to commit all those mistakes and appreciate what it does.
- Also, once again you'd be hit with things that you would have no idea about.
- You'd need to take care of a lot more things: Bundler, Ruby LSP, RuboCop. You'd drown in inane configuration because of this, not to mention all the potential problems that you would not be equipped to deal with at that point.

Hope that clears this up. Don't forget: RuboCop and the style guide are there to help *you* write predictable, cleaner code. The standards might vary between teams, some of the expectations RuboCop puts on you seem impossible to fulfill and you might feel like some of the rules are too constraining.

With time, you are going to be better at adhering to rules but perhaps more importantly, you'll understand *why* and *when* to break them. For now, enjoy the ride on the shoulders of giants.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Learn some more [about what linting is](https://en.wikipedia.org/wiki/Lint_(software)).
1. Acquaint yourself with [the introduction to Ruby Style Guide](https://rubystyle.guide/) and skim it a little.
1. Check out [what RuboCop is about](https://docs.rubocop.org/rubocop/index.html) and explore its docs.
1. [Watch Sandi Metz' "Rules"](https://www.youtube.com/watch?v=npOGOmkxuio) for a lovely exploration of the what, why and how of rules generally and also in the Ruby context.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What is a style guide?](#style-guide)
- [What is formatting?](#formatting)
- [What is linting?](#linting)
- [How do you install RuboCop?](#install-rubocop)
- [How do you run RuboCop in a command line interface?](#cli-rubocop)
- [How do you read RuboCop's output?](#output-rubocop)
- [How do you configure RuboCop?](#configure-rubocop)
- [Why is Metrics department so important for new Rubyists?](#importance-metrics)
- [What is the ABC metric?](#abc)
- [What is cyclomatic complexity?](#cyclomatic)
- [What is perceived complexity?](#perceived)
- [How do you configure RuboCop in VSCode?](#vscode-rubocop)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- If you're curious about RuboCop's history and how it works [Bozhidar Batsov's All About RuboCop talk](https://www.youtube.com/watch?v=nrHjVCuVsGA) should be a satisfying listen.
- [Vincius Stock's Improving the development experience with language servers talk](https://www.youtube.com/watch?v=kEfXPTm1aCI) is great for people who want to know more about Language Server Protocol, specifically the Ruby one.
- [Honeybadger's article about Rubocop](https://www.honeybadger.io/blog/linting-formatting-ruby/) might give you a different perspective and introduce some features not covered in the lesson.
