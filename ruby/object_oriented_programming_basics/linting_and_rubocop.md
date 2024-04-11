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
- [ ] How to write a custom .rubocop.yml / add plugins

### Convention time again

You have already been exposed to some of the conventions in HTML, CSS, JS and Ruby.
This is whyJS has its variables written `likeThis` while Ruby's are `like_this`, why functions are verbs and variables are things like `do_something(with_thing, another_thing)`. Why there exists
a preference for getting rid of `if` statements, why some languages prefer loops while other prefer iterative approaches. Why some features
present in languages are strongly discouraged - remember `var`, `eval()` or `$global_variable`s?

There's *a lot* more of these relating to features of Ruby (or a different language!) that you might never even have heard of. The good news is that there exist style guides:
a set of standards for writing and organizing code. The bad news? Your head would need to store that entire set of standards and be able to recall them whenever working with code.

### Your code has pockets, too

Enter another set of tools: linters and formatters. Those do the remembering job for you - they shall point out that something's wrong. Perhaps they might automatically fix
some of the issues or at least provide hints or references to the style guide that might help you in writing cleaner code. For that, Rubyists have a powerful ally:

RuboCop. A really polished gem that will make your code shine!


### Assignment

<div class="lesson-content__panel" markdown="1">

1. https://rubystyle.guide/
1. https://docs.rubocop.org/rubocop/index.html
1. https://github.com/rubocop/rubocop

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
