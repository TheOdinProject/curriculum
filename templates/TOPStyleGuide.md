# TOP Markdown Style Guide

[Inspired by google's styleguide](https://github.com/google/styleguide/edit/gh-pages/docguide/style.md)

TOP uses Markdown for its lessons to be easily read and edited, and get properly formatted HTML for the TOP website. 

**The two goals of this style guide are to help create:**

*   Simple Markdown for readability and editability.   
*   Consist Markdown for consistency on the TOP site and to guide in the creation of new content.

**Contents:**

1.  [Lesson layout](#lesson-layout)
1.  [Project layout](#Project-layout)
1.  [Headings](#headings)
    1.  [ATX-style headings](#atx-style-headings)
    1.  [Add spacing to headings](#add-spacing-to-headings)
1.  [Lists](#lists)
    1.  [Use lazy numbering for long lists](#use-lazy-numbering-for-long-lists)
    1.  [Nested list spacing](#nested-list-spacing)
1.  [Code](#code)
    1.  [Inline](#inline)
    1.  [Codeblocks](#codeblocks)
    1.  [Declare the language](#declare-the-language)
    1.  [Nest codeblocks within lists](#nest-codeblocks-within-lists)


## Lesson Layout

~~~markdown

### Introduction

A brief summary about what this lesson is about and why the topics or concepts it covers are important.

### Learning Outcomes

*Look through these now and then use them to test yourself after doing the assignment*

what the student is expected to know or be able to do by the end of this lesson

*   Learning outcome 1
*   Learning outcome 2
*   Learning outcome 3

### Assignment

<div class="lesson-content__panel" markdown="1">
The list of resources the user will go through to learn about the topic of this lesson. Have no more than 5 resources, ideally no more than three.
</div>

### Exercises

A group of exercises (If Applicable) for the student to complete in relation to the topic taught in the lesson. 

### Additional Resources

*This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something*

Link to no more than three additional resources to avoid this section becoming too cluttered.

### Knowledge Check

*This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, clicking the small arrow to the left of the question will reveal the answers.*

Should repeat learning outcomes with answers.

<details>
  <summary>Learning outcome 1.</summary>
    <ul>
      <li>Learning outcome 1 answer</li>
      <li>Learning outcome 1 answer</li>
    </ul>
</details>

<details>
  <summary>Learning outcome 2.</summary>
    <ul>
      <li>Learning outcome 2 answer</li>
    </ul>
</details>
~~~
## Project Layout

~~~markdown

### Introduction 

A brief introduction to the project and an over view of what the student will be building.

### Assignment

<div class="lesson-content__panel" markdown="1">
Describe the requirements or users stories for the project in detail.
</div>

### Helpful Links

Links that may help with the project if any

### Student Solutions

Submit a solution with a pull request to this...

-   Add your solution below this line!

~~~

## Headings

### ATX-style headings

~~~markdown
### Section Header
~~~

Use Heading 3 for section titles with Title Case

### Add spacing to headings

Prefer spacing after `###` and newlines before and after:

~~~markdown
...text before.

### Section Header

Text after...
~~~

### Sub-Headers

Use `####` for sub-headers that are on thier own line and `**Sub-header**` for inline.

~~~markdown
...text before.

#### Sub Header

Text after...

**Sub-header:** Some text defining this sub-header...
~~~


## Lists

### Use lazy numbering for long lists

Markdown is smart enough to let the resulting HTML render your numbered lists
correctly. For longer lists that may change, especially long nested lists, use
"lazy" numbering:

~~~markdown
1.  Foo.
1.  Bar.
    1.  Foofoo.
    1.  Barbar.
1.  Baz.
~~~

However, if the list is small and you don't anticipate changing it, prefer fully
numbered lists, because it's nicer to read in source:

~~~markdown
1.  Foo.
2.  Bar.
3.  Baz.
~~~

### Nested list spacing

When nesting lists, use a 4 space indent for both numbered and bulleted lists:

~~~markdown
1.  2 spaces after a numbered list.
    4 space indent for wrapped text.
2.  2 spaces again.

*   3 spaces after a bullet.
    4 space indent for wrapped text.
    1.  2 spaces after a numbered list.
        8 space indent for the wrapped text of a nested list.
    2.  Looks nice, don't it?
*   3 spaces after a bullet.
~~~

### Mulit-line list items

When list items, wrap into multiple lines consider adding newlines per item 
to make it more readable:

~~~markdown

1.  This is a long long long long long long long long long long long long long 
    long long long long long long list item.

2.  This is another long long long long long long long long long long long long
    long long long long long long long list item.

~~~

This will add a paragraph tag to your list item `<li><p></p></li>`

## Code

### Inline

&#96;Backticks&#96; designate `inline code`, and will render all wrapped content
literally. Use them for short code quotations and field names:

~~~markdown
Write these in the `script` tag of a skeleton html file.

...which is why we can call `taco.printString()` but not `taco.capitalizeString()`. 
~~~

Use inline code when referring to file types in an abstract sense, rather than a
specific file:

~~~markdown
Be sure to update your `README.md`!
~~~

### Codeblocks

For code quotations longer than a single line, use a codeblock with tilde marks:

<pre>
~~~javascript
const obj = {
  name: "object",
  marker: "X"
}
~~~
</pre>

#### Declare the language

It is best practice to explicitly declare the language, so that neither the
syntax highlighter nor the next editor must guess.


#### Nest codeblocks within lists

If you need a codeblock within a list, make sure to indent it so as to not break
the list:

~~~markdown
*   Bullet.

    ~~~ruby
    puts foo;
    ~~~

*   Next bullet.
~~~
