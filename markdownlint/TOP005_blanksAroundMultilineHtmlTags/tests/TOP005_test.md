### Introduction

This file should not be flagged with any errors.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- LO item

### Assignment

<div class="lesson-content__panel" markdown="1">

Valid div due to each tag being surrounded by blank lines.

</div>

#### Custom section

<div>Valid single-line div</div>

<div>Valid single-line div</div>Might even have other <span>paragraph</span> content with it.

<div class="lesson-content__panel" markdown="1">
1. Opening tag invalid due to not being surrounded by blank lines.
2. Closing tag is, so is valid.
3. Notice how non-lazy numbering does not flag a lint error, as the list content is part of the same `html_block` token, and not as their own separate tokens to be linted.

</div>

Non-empty line
<div class="lesson-content__panel" markdown="1">

1. Opening tag invalid due to not being surrounded by blank lines.
2. Closing tag invalid due to not being surrounded by blank lines.
3. Notice how non-lazy number and blanks around lists rules are trigger, as the blank line 34 allows the list to be parsed as their own correct tokens.
</div>

<div>
Also invalidates when HTML blocks are chained without blank lines between them.
</div>
<div>
Also invalidates when HTML blocks are chained without blank lines between them.
</div>

```md
<div>

The only exception to blank lines is a code block delimiter.

</div>
```

```md
<div>

This line above the closing tag is not a blank line nor a code block delimiter, so this errors.
</div>
```

```html
<div>
  <p>
    Does not flag when used in an HTML example
  </p>
</div>
```

```jsx
<p>
  Also accepts when used in JSX code blocks
</p>
```

```md
<p>
    But does not like it if done in a non-HTML/JSX code block
</p>
```

<!-- markdownlint-disable-next-line -->
### `Will not flag ignore comments which require being directly followed by the line to ignore`

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- KC item

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- AR item
