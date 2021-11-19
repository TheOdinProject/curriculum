# TOP Markdown Style Guide

[Inspired by google's styleguide](https://github.com/google/styleguide/edit/gh-pages/docguide/style.md)

TOP uses Markdown for its lessons and projects to be easily read and edited, and get properly formatted HTML for the TOP website. 

**The goals of this style guide are to help create Markdown that is:**

*   Readable for as many users as possible.
*   Editable by any contributor.
*   Consistent across the TOP website.

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
1.  [Links](#links)
1.  [Images](#images)


## Layouts

In general, the following layouts should be used for all lessons and projects.

### Lesson Layout

~~~markdown

### Introduction

A BRIEF INTRODUCTION.

### Learning Outcomes

This section contains a general overview of topics that you will learn in this lesson.

*   A LEARNING OUTCOME.

### CUSTOM SECTION HEADING

CUSTOM SECTION CONTENT.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. A RESOURCE/TASK.
</div>

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

*   <a class="knowledge-check-link" href="A KNOWLEDGE CHECK URL">A KNOWLEDGE CHECK QUESTION.</a>

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

*   It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.

~~~

1. `### Introduction`: A brief summary on what the lesson is about and why the topics or concepts it covers are important. Replace the `A BRIEF INTRODUCTION.` text with your own lesson introduction.

2. `### Learning Outcomes`: A bulleted list of items that provide a general overview of what the student is expected to know or be able to do by the end of the lesson. Replace the `A LEARNING OUTCOME.` text with your own learning outcome, then add any additional bulleted learning outcome items. The lesson should ideally have no more than 7 learning outcomes, but this number might vary by lesson. **If the lesson does not have any learning outcomes, remove this entire section from the lesson.**

3. `### CUSTOM SECTION HEADING`: A custom section that contains some of the main content of the lesson. Replace the `CUSTOM SECTION HEADING` text with a proper section heading and the `CUSTOM SECTION CONTENT.` text with your own content, then add any additional custom sections.

4. `### Assignment`: A numbered list of external resources the user must read or tasks they must accomplish that counts towards completion of the lesson. Each resource/task should include some brief text that further informs the user on why it is included in the assignment or what purpose it serves, as well as any additional instructions (e.g. what sections to read in an external resource or which exercises to complete). 

    Replace the `A RESOURCE/TASK.` text with your own resource or task, then add any additional numbered assignment items. The assignment should ideally have no more than 3-5 resources and/or tasks. **If the lesson does not have an assignment, remove this entire section from the lesson.**

5. `### Knowledge Checks`: A bulleted list of specific questions that a user should be able to answer on their own after reading the lesson and completing the assignment. Each knowledge check should only link either to a Heading 3 `###` section within the lesson or a resource previously linked to in the lesson. This link should help users review the necessary material in order to answer the knowledge check. 

    Replace the `A KNOWLEDGE CHECK URL` text with the actual link to the section/resource and the `A KNOWLEDGE CHECK QUESTION.` text with your own question/problem that the user should be able to solve. Then add any additional bulleted knowledge check items. The lesson should ideally have no more than 7 knowledge checks, but this number might vary by lesson **If the lesson does not have any knowledge checks, remove this entire section from the lesson.**

    In order to link to a Heading 3 `###` section within the lesson, replace the `href` value for the knowledge check link with a hashtag `#` followed immediately by the section title in lowercase, with any spaces replaced with hyphens `-`. For example, a section titled `### Creating a Method` would be linked to with `href="#creating-a-method"`.

6. `### Additional Resources`: A bulleted list of optional resources for the user to read. Additional resources should be related to the content of the lesson in some way, without being necessary to gain an understanding of said content. **If the lesson doesn't include any additional resources, leave this section as-is**. Otherwise, replace the first bulleted resource item with your own resource, then add any additional bulleted resource items. The lesson should ideally have no more than 3-5 additional resources. 

### Project Layout

~~~markdown

### Introduction 

A BRIEF INTRODUCTION.

### PRE-ASSIGNMENT SECTION HEADING

PRE-ASSIGNMENT SECTION CONTENT.

### Assignment

<div class="lesson-content__panel" markdown="1">

1.  A REQUIREMENT/USER STORY.

#### Extra Credit

1.  AN OPTIONAL ADD-ON/USER STORY.

</div>

### POST-ASSIGNMENT SECTION HEADING

POST-ASSIGNMENT SECTION CONTENT.

~~~

1. `### Introduction`: A brief summary on what the project is and an over view of what the user will be building. Replace the `A BRIEF INTRODUCTION.` text with your own project introduction.

2. `### PRE-ASSIGNMENT SECTION HEADING`: *Optional*. A section that contains content that should come before the actual project assignment. This section will most likely not be needed for most projects, but when it is needed simply replace the `PRE-ASSIGNMENT SECTION HEADING` text with a proper section heading and the `PRE-ASSIGNMENT SECTION CONTENT.` text with your own content. Then add any additional pre-assignment sections. **If the project does not have a pre-assignment section, remove this entire section from the project.**

4.  `### Assignment`: A numbered list of items that describe detailed requirements or user stories that must be followed in order to complete the project. Replace the `A REQUIREMENT/USER STORY.` with your own requirement, then add any additional numbered requirement items.

5. `#### Extra Credit`: A numbered list of items that describe any optional add-ons or user stories that might make a user's project stand out. Replace the `AN OPTIONAL ADD-ON/USER STORY.` text with your own add-on, then add any additional numbered add-on items. **If the project does not have any extra credit items, remove the extra credit section from the assignment.**

2. `### POST-ASSIGNMENT SECTION HEADING`: *Optional*. A section that contains content that should come after the actual project assignment. This section will most likely not be needed for most projects, but when it is needed simply replace the `POST-ASSIGNMENT SECTION HEADING` text with a proper section heading and the `POST-ASSIGNMENT SECTION CONTENT.` text with your own content. Then add any additional post-assignment sections. **If the project does not have a post-assignment section, remove this entire section from the project.**

## Headings

### ATX-style headings

Use Heading 3 `###` and Title Case for section titles:

~~~markdown
### Section Heading
~~~

### Add spacing to headings

Prefer spacing after `###` and newlines before and after:

~~~markdown
...text before.

### Section Heading

Text after...
~~~

### Sub-Heading

Use Heading 4 `####` for sub-headings that are on their own line and `**Sub-heading**` for inline:

~~~markdown
...text before.

#### Sub Heading

Text after...

**Inline Sub-heading:** Some text defining this sub-heading...
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

When list items wrap into multiple lines, consider adding newlines per item 
to make it more readable:

~~~markdown

1.  This is a long long long long long long long long long long long long long 
    long long long long long long list item.

2.  This is another long long long long long long long long long long long long
    long long long long long long long list item.

~~~

This will add a paragraph tag to your list item: `<li><p></p></li>`

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

It is best practice to explicitly declare the language immediately after the opening tilde marks, so that neither the
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

## Links

Long links make source Markdown difficult to read and break the 80 character wrapping. **Wherever possible, shorten your links**.

### Use informative Markdown link titles

Markdown link syntax allows you to set a link title, just as HTML does. Use it wisely.

Titling your links as "link" or "here" tells the reader precisely nothing when quickly scanning your doc and is a waste of space. Instead, write the sentence naturally, then go back and wrap the most appropriate phrase with the link:

~~~markdown
See the [lesson template](lesson.md) for a more easily copyable lesson file.
Or, check out the [project template](project.md) for a more easily copyable project file.
~~~

## Images

Images in Markdown follow the same syntax as links, except they begin with an exclamation point `!`:

~~~markdown
![flex shorthand](https://cdn.statically.io/gh/TheOdinProject/curriculum/495704c6eb6bf33bc927534f231533a82b27b2ac/html_css/v2/foundations/flexbox/imgs/10.png)
~~~

The text in square brackets will be included as the image's alt text. Similar to link titles, the alt text should be informative, but shouldn't be overly verbose.

In order to properly add images to a lesson, follow the instructions in our [Adding Images to the Curriculum](https://github.com/TheOdinProject/curriculum/wiki/Adding-Images-to-the-Curriculum) Wiki page.