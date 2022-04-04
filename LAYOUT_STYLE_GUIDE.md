# Layout Style Guide

[Inspired by google's styleguide](https://github.com/google/styleguide/blob/gh-pages/docguide/style.md)

TOP uses Markdown for the layout and formatting of lesson and project files to get properly formatted HTML for the TOP website. 

**The goals of this style guide are to help create Markdown that is:**

*   Readable for as many users as possible.
*   Editable by any contributor.
*   Consistent across the TOP website.

**Contents:**

1.  [Lesson layout](#lesson-layout)
1.  [Project layout](#project-layout)
1.  [Headings](#headings)
    1.  [ATX-style headings](#atx-style-headings)
1.  [Newlines](#newlines)
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
1.  [Codepen Embeds](#codepen-embeds)


## Layouts

In general, the following layouts should be used for all lessons and projects. Text that should be replaced with the author's own content will be in all CAPS, with any additional information regarding a section listed at the end of the layout code block.

When adding new lessons or projects, make a copy of either the [lesson template](./templates/lesson-template.md) or the [project template](./templates/project-template.md) in the appropriate folder where the new lesson/project should be placed. Then begin editing the template copy.

The [lesson example](./templates/lesson-example.md) and [project example](./templates/project-example.md) files both show how this style guide can be put to use in an actual lesson/project. They don't cover every situation (the lesson example doesn't show a lesson with an assignment and one without, for example), but they should give you a better representation of how lessons/projects should look after this style guide is applied.

### Lesson Layout

~~~markdown

### Introduction

A BRIEF INTRODUCTION.

### Lesson Overview

This section contains a general overview of topics that you will learn in this lesson.

*   A LESSON OVERVIEW ITEM.

### CUSTOM SECTION HEADING

CUSTOM SECTION CONTENT.

### Assignment

<div class="lesson-content__panel" markdown="1">

1.  A RESOURCE OR EXERCISE ITEM
    *   AN INSTRUCTION ITEM

</div>

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

*   <a class="knowledge-check-link" href="A KNOWLEDGE CHECK URL">A KNOWLEDGE CHECK QUESTION.</a>

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

*   It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.

~~~

1.  `### Introduction`: A brief summary on what the lesson is about and/or why the topics or concepts it covers are important. Replace the `A BRIEF INTRODUCTION.` text with your own lesson introduction.

2.  `### Lesson Overview`: A bulleted list of items that provide a general overview of what the user will learn about in the lesson. Lesson Overviews should include general, higher level statements that cover the core concepts of the lesson. They should serve and be phrased as a list of key items that a user should be expected to *learn about* throughout the lesson, rather than a list of things they should be able to *do* by the end of it.

    Replace the `A LESSON OVERVIEW ITEM.` text with your own lesson overview item, then add any additional bulleted lesson overview items. The lesson should ideally have no more than 7 lesson overview items, but this number might vary by lesson. **If the lesson does not have a lesson overview, remove this entire section from the lesson.**

3.  `### CUSTOM SECTION HEADING`: A custom section that contains some of the main content of the lesson. Replace the `CUSTOM SECTION HEADING` text with a proper section heading and the `CUSTOM SECTION CONTENT.` text with your own content, then add any additional custom sections. **If the lesson does not have any custom sections, remove this entire section from the lesson.**

4.  `### Assignment`: A numbered list of external resources the user must read or watch, or practical exercises the user must complete (such as our exercise repos), in order to fully complete the lesson. 

    Each assignment item should include some brief text that further informs the user on why it is included in the assignment or what purpose it serves. When necessary, an assignment item should also explicitly state any instructions that should be followed. Examples of instructions can include (but aren't limited to) a specific section the user should read, whether the user should complete any specific exercises, and whether the user should redirect themselves to additional links within the resource.

    Replace the `A RESOURCE OR EXERCISE ITEM.` text with your own text and a link to the resource or exercise (or any applicable instructions if an exercise isn't external), then add any additional numbered assignment items. The lesson should ideally have no more than 3-5 assignment items (reading several sections on a web page or completing a folder of 5 exercises would be considered a single assignment item). **If the lesson does not have an assignment, remove this entire section from the lesson.**

    If an assignment item includes any instructions, replace the `AN INSTRUCTION ITEM` text with a single instruction, then add any additional bulleted instruction items. 
    
    If a user should only read specific sections within a resource (e.g. "Skip Chapter 7") or complete only specific exercises (e.g. "Complete the first two exercises in the repo"), each instruction item should be its own bullet. 
    
    **If an assignment item does not have any instructions, remove the bulleted `AN INSTRUCTION ITEM` text from it.**

5.  `### Knowledge Check`: A bulleted list of specific questions that a user should be able to answer on their own after reading the lesson and completing any assignment or practice. A knowledge check should only link either to a section within the lesson (either with a Heading 3 `###` or Heading 4 `####`, or by wrapping text in a `<span>` element with an `id` attribute) or a resource previously linked to in the lesson. This link should help users review the necessary material in order to answer the knowledge check without requiring them to re-read the entire lesson.

    Replace the `A KNOWLEDGE CHECK URL` text with the actual link to the section/resource and the `A KNOWLEDGE CHECK QUESTION.` text with your own question/problem that the user should be able to answer/solve. Then add any additional bulleted knowledge check items. The lesson should ideally have no more than 7 knowledge checks, but this number might vary by lesson. **If the lesson does not have a knowledge check, remove this entire section from the lesson.**

    In order to link to a Heading 3 `###` or Heading 4 `####` within the lesson, replace the `href` value for the knowledge check link with a hashtag `#` followed immediately by the section title in lowercase and any spaces replaced with a hyphen `-`. For example, a Heading 3 section titled `### Creating a Method` would be linked to with `href="#creating-a-method"`.
    
    In order to link to a `<span>` element within the lesson, replace the `href` value with the exact `id` attribute of the `<span>` element (this will be case sensitive).  For example, a `<span id="Knowledge-Check-3">` element would be linked to with `href="#Knowledge-Check-3"`.

6.  `### Additional Resources`: A bulleted list of optional resources for the user to read. Additional resources should be related to the content of the lesson in some way, without being necessary to gain an understanding of the lesson content. An additional resource should include brief text that further informs the user on why it is included or what purpose it serves.

    **If the lesson doesn't include any additional resources, leave this section as-is**. Otherwise, replace the default bulleted resource item with your own resource, then add any additional bulleted resource items. The lesson should ideally have no more than 3-5 additional resources.

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

*   AN OPTIONAL ADD-ON/USER STORY.

</div>

### POST-ASSIGNMENT SECTION HEADING

POST-ASSIGNMENT SECTION CONTENT.

~~~

1.  `### Introduction`: A brief summary on what the project is and an overview of what the user will be building. Replace the `A BRIEF INTRODUCTION.` text with your own project introduction.

2.  `### PRE-ASSIGNMENT SECTION HEADING`: *Optional*. A section that contains content that should come before the actual project assignment. This section will most likely not be needed for most projects, but when it is needed simply replace the `PRE-ASSIGNMENT SECTION HEADING` text with a proper section heading and the `PRE-ASSIGNMENT SECTION CONTENT.` text with your own content. Then add any additional pre-assignment sections. **If the project does not have a pre-assignment section, remove this entire section from the project.**

3.  `### Assignment`: A numbered list of items that describe detailed requirements or user stories that must be followed in order to complete the project. Replace the `A REQUIREMENT/USER STORY.` with your own requirement, then add any additional numbered requirement items.

4.  `#### Extra Credit`: A bulleted list of items that describe any optional add-ons or user stories that might make a user's project stand out. Replace the `AN OPTIONAL ADD-ON/USER STORY.` text with your own add-on, then add any additional bulleted add-on items. **If the project does not have any extra credit items, remove the extra credit section from the assignment.**

5.  `### POST-ASSIGNMENT SECTION HEADING`: *Optional*. A section that contains content that should come after the actual project assignment. This section will most likely not be needed for most projects, but when it is needed simply replace the `POST-ASSIGNMENT SECTION HEADING` text with a proper section heading and the `POST-ASSIGNMENT SECTION CONTENT.` text with your own content. Then add any additional post-assignment sections. **If the project does not have a post-assignment section, remove this entire section from the project.**

## Headings

### Title Case

Headings should always use [Wikipedia Style Title Case](https://titlecaseconverter.com/rules/#WP):

~~~markdown
### This Is Wikipedia Style Title Case

### This is not Wikipedia style title case
~~~

You can use the [Title Case Converter](https://titlecaseconverter.com/) tool to help convert text to Wikipedia Title Case; just select the Wikipedia "Styles" option.

### No Code Snippets

Headings should never contain any code snippets.

```markdown
<!-- Wrong -->
### The `id` Property

<!-- Right -->
### The id Property
```

### ATX-style headings

Use Heading 3 `###`  for main section titles ("Lesson Overview", "Assignment", custom sections, etc):

~~~markdown
### Section Heading
~~~

### Sub-heading

Use either Heading 4 `####` for sub-headings that are on their own line or `**Sub-heading**` for inline:

~~~markdown
...text before.

#### Sub-heading

Text after...

**Inline Sub-heading:** Some text defining this sub-heading...
~~~

## Newlines

Each Markdown file should have an empty newline at the very end, after all of the file's contents. 

Always add a newline before and after a heading, a list, an Assignment panel, or any other content that is not strictly text:

~~~markdown
Content before...

### Section Heading

1. A list item

...content after.
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

#### No Extraneous Characters

Codeblocks should only contain actual code snippets, terminal commands, or commented out text. Never include leading terminal content, such as the dollar sign `$` you might see preceding any commands you type in.

```bash
// The below example is incorrect
$ cd Documents

// The below is correct
cd Documents
```

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
See the [lesson template](./templates/lesson-template.md) for a more easily copyable lesson file.
Or, check out the [project template](./templates/project-template.md) for a more easily copyable project file.
~~~

### Don't place links throughout lessons

Links to required reading should not be placed throughout a lesson, and should instead be placed in either the `### Assignment` or `### Additional Resources` section. Links that refer a user to a previous lesson as a refresher, or a link to a Wikipedia page that offers a definition/explanation of a term are fine to place outside of these two sections.

## Images

Images in Markdown follow the same syntax as links, except they begin with an exclamation point `!`:

~~~markdown
![flex shorthand](https://cdn.statically.io/gh/TheOdinProject/curriculum/495704c6eb6bf33bc927534f231533a82b27b2ac/html_css/v2/foundations/flexbox/imgs/10.png)
~~~

The text in square brackets will be included as the image's alt text. Similar to link titles, the alt text should be informative, but shouldn't be overly verbose.

In order to properly add images to a lesson, follow the instructions in our [Adding Images to the Curriculum](https://github.com/TheOdinProject/curriculum/wiki/Adding-Images-to-the-Curriculum) Wiki page to get a statically URL as seen in the codeblock above.

## Codepen Embeds

In order to embed a Codepen example into a lesson, you must be in the editor view for the Codepen you wish to embed and then click the `Embed` button at the bottom right of the page.

The following options should be selected when creating a Codepen embed:

* **Default Tabs**: The "Result" tab must be selected in addition to one of the other three options (HTML, CSS, or JavaScript), depending on the main purpose of the Codepen. If the purpose is to show an HTML concept then the "HTML" option must also be selected, for example.
* **Theme**: "Dark"
* **Use Click-to-Load**: "Off"
* **Make Code Editable**: "On"

Finally, the **HTML (Recommended)** code option must be the one that is copy + pasted into the lesson.

### Maintainer Instructions

When a user adds a Codepen embed to a lesson, a maintainer should fork the embed to the official [TOP Codepen](https://codepen.io/TheOdinProjectExamples/) account. When necessary, the name of new pens should be updated to better reflect their purpose, e.g. `Simple SVG Example` for a pen showing a simple SVG or `max-width | CSS Responsiveness` for a pen about the `max-width` property.

After forking a pen to the TOP account and ensuring the embeds options from above are selected, the lesson the original embed is from should be updated to include the forked, TOP version instead.
