### Introduction

This file should flag with TOP005 errors, and no other linting errors.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- LO item.

### Assignment

<div class="lesson-content__panel" markdown="1">

</div>

#### Custom section

<div class="lesson-content__panel" markdown="1">

The opening tag is invalid due to not being surrounded by blank lines.
Until a blank line is encountered, if there are any unrelated linting errors, the vast majority of them will not be caught due to how `markdown-it` parses `html_block` tokens.

The closing tag is valid as it is surrounded by blank lines.

</div>

Non-empty/codeblock line

<div class="lesson-content__panel" markdown="1">

The opening tag is invalid due to not being surrounded by blank lines or codeblock delimiters.
The blank line after it does allow the linter to correctly flag and unrelated linting errors in these lines if there are any.

</div>

<div>

Also invalidates when HTML blocks are chained without blank lines between them.

</div>

<div>

Also invalidates when HTML blocks are chained without blank lines between them.

</div>

```markdown
<div>

This line above the closing tag is not a blank line nor a code block delimiter, so the closing tag errors.

</div>
```

```markdown
<p>

    Flags such tags if not in an ignored code block (like HTML/JS/JSX etc.)

</p>

<div>

  <p>

    TOP005 doesn't care it the tag is indented or not.

  </p>

</div>
```

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- KC item

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- AR item
