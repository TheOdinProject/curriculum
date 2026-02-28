### Introduction

This file should not flag any errors.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- LO item.

### Assignment

<div class="lesson-content__panel" markdown="1">

Valid div due to each tag being surrounded by blank lines.

</div>

#### Custom section

<div>Valid single-line div</div>

<div>Valid single-line div</div>Might even have other <span>paragraph</span> content with it.

```markdown
<div>

The only exception to blank lines is a code block delimiter.

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
  Also does not flag when used in JSX code blocks
</p>
```

```erb
<%= if language.isErb? %>
  <p>Also does not flag when used in erb code blocks</p>
<% end %>
```

```ejs
<% if (isEjs) { %>
  <p>Also does not flag when used in ejs code blocks</p>
<% } %>
```

```ruby
if ruby?
  html_fragment = <<~HTML
    <p>Does not flag when used in ruby code blocks</p>
  HTML
end
```

```javascript
const htmlString = `
  <p>Does not flag when used in JavaScript code blocks, e.g. template literals.</p>
`;
```

<!-- markdownlint-disable-next-line -->
### `Will not flag ignore comments which require being directly followed by the line to ignore`

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- KC item

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- AR item
