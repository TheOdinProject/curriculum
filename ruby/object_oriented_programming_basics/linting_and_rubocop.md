### Introduction

Code. Code is written for our machines to execute but more importantly, it is written for us, humans, to understand.

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
- What the differences between RuboCop in the CLI and in your VSCode are.
- What cyclomatic complexity and ABC metrics are.

- [ ]  Gem installation + IDE integration
- [ ]  Difference between CLI and IDE versions, visual examples
- [ ]  Brief explanation of linting
- [ ]  Intro to community style guide + difference between different types of rules (style, lint, performance etc)
- [ ] Explanation of more confusing rules (such as ABC / cyclomatic complexity metrics)
- [ ] How to write a custom .rubocop.yml / add plugins / use inline disable/enable of rubocop Cops

### Convention time again

You have already been exposed to some of the conventions in HTML, CSS, JS and Ruby.
This is why JS has its variables written `likeThis` while Ruby's are `like_this`, why functions are verbs and variables are things like `do_something(with_thing, another_thing)`. Why there exists
a preference for getting rid of `if` statements, why some languages prefer loops while other prefer iterative approaches. Why some features
present in languages are strongly discouraged - remember `var`, `eval()` or `$global_variable`s?

There's *a lot* more of these relating to features of Ruby (or a different language!) that you might never even have heard of. The good news is that there exist style guides:
a set of standards for writing and organizing code. The bad news? Your head would need to store that entire set of standards and be able to recall them whenever working with code.

### Your code has pockets, too

Enter another set of tools: linters and formatters. Those do the remembering job for you - they shall point out that something's wrong. Perhaps they might automatically fix
some of the issues or at least provide hints or references to the style guide that might help you in writing cleaner code. For that, Rubyists have a powerful ally:

RuboCop. A really polished gem that will make your code shine!

Before you and RuboCop do a check-up on your Caesar Cipher project, let's talk some more about the Ruby Style Guide, starting with how it introduces itself:
> This Ruby style guide recommends best practices so that real-world Ruby programmers can write code that can be maintained by other real-world Ruby programmers. A style guide that reflects real-world usage gets used, while a style guide that holds to an ideal that has been rejected by the people it is supposed to help risks not getting used at all - no matter how good it is. (...)
 The guidelines provided here are intended to improve the readability of code and make it consistent across the wide spectrum of Ruby code.

As you can see, those are *recommendations* dictated by real-world usage aimed at improving readibility and consistency of Ruby code. In the end, it is like the difference between how you send your messages online versus how you'd write an essay. One is about communicating quickly, the other is about communicating clearly.

The various conventions can be grouped based on what aspects of your code they deal with. As a starting point, lets use some of RuboCop's departments - Style, Lint and Metrics. Perhaps you've anticipated that RuboCop doesn't work alone - it indeed has a whole precint behind itself. The various Cops are interested in making sure that some particular rule is not broken. Let the departments speak for themselves:

> Style Cops check for stylistic consistency of your code. Many of the them are based on the Ruby Style Guide.
>
> Lint Cops check for ambiguities and possible errors in your code.
>
> Metrics Cops deal with properties of the source code that can be measured, such as class length, method length, etc.

You'll have an opportunity to dig into particulars of the Ruby Style Guide soon and as for the Cops - they'll make sure to make themselves known. On that note, let's begin the investigation, detective!

### Section where you learn all about code crime

As mentioned earlier, RuboCop is a gem and the project we want to investigate is Caesar Cipher. Go back and install RuboCop locally (as in, use Bundler) and then run `bundle exec rubocop` in your terminal. Running it like this makes sure that the local version of RuboCop is used and it will check all the files in the current working directory *and* its subdirectories. In short: everything.

Whoah! Well, at least for me - perhaps you're a savant and a Ruby Style natural, in that case, here's some example output:

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

Let's break this down.
The output starts with telling how many files are to be inspected:

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

You could ask why such a foundational gem as Bundler can run into trouble with the law. The answer is that RuboCop is highly customizable to accommodate many standards that programmers
might have. Remember: what is important in linting in formatting is making sure everyone in a group plays by the same rules, so the code is more readable.

Before you unleash the automated fury of RuboCop upon your code, you might want to become acquianted with a nifty flag: `-S`. This will provide a link to the Ruby Style Guide
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

2 files inspected, 16 offenses detected, 14 offenses corrected, 2 more offenses can be corrected with `rubocop -A`
# Duplicate offenses were truncated.
```

See that green `.`? That means the first file is now all fine and dandy! Some of the offenses were not corrected by RuboCop and that's because `-a` is for safe autocorrect.
If you wanted to go through with the `[Correctable]` offenses, you'd want to use `-A` as the output helpfully suggests. This is due to the fact that some Cops are safe, some are unsafe.

The safe Cops promise that they won't have false positives and that
their autocorrect is won't change the semantics of the code and it will be fully equivalent to what you've had written. From this it follows that unsafe Cops either have false positives or slightly change the semantics of the code. The first characteristic means they tell you something is wrong when actually, everything is alright - for example, you've got a method with the same name as one in standard library in your object and RuboCop treats it as if it were the standard library method.

<!--
TODO: find out whether https://docs.rubocop.org/rubocop/usage/autocorrect.html talks about human semantics or the machine semantics.
The second example seems to suggest the latter - autocorrecting breaks the code.
-->
The latter means that while your code and the proposed code arrive at the same output, they might change how (but not what) the output is achieved or produce a side-effect that causes issues in your code.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. https://rubystyle.guide/
1. https://docs.rubocop.org/rubocop/index.html
1. https://github.com/rubocop/rubocop
1. https://en.wikipedia.org/wiki/Lint_(software)

#### OPTIONAL CUSTOM ASSIGNMENT HEADING

1. A RESOURCE OR EXERCISE ITEM
   - AN INSTRUCTION ITEM

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [A KNOWLEDGE CHECK QUESTION](A-KNOWLEDGE-CHECK-URL)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- https://www.youtube.com/watch?v=nrHjVCuVsGA
- https://www.youtube.com/watch?v=kEfXPTm1aCI
