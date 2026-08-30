### Introduction

This file should flag with TOP006 errors, and no other linting errors.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- LO item.

### Assignment

<div class="lesson-content__panel" markdown="1">

Assignment

</div>

#### Custom section

```javascript
console.log("This code block should flag an error as it uses "js" instead of "javascript".");
```

<!-- markdownlint-disable TOP008 -->
~~~javascript
console.log("The rule will still flag even if tilde delimiters are used");
~~~
<!-- markdownlint-enable TOP008 -->

```javascript
console.log("This code block is valid as it uses the appropriate full name.");
```

```markdown
The rule catches the following languages, as they are they ones expected to be seen in this repo's files
md => markdown
rb => ruby
js => javascript
txt => text
sh => bash
yml => yaml
```

```ruby
puts "Example of rb flagging."
```

```ruby
puts "Use the full name!"
```

```text
As does txt.
```

```yaml
description: This will flag
```

```yaml
description: Unless you use the full name
```

```bash
prefer --bash-over-sh
```

```bash
like --this
```

```html
<p>HTML is not considered as only the abbreviated name is a valid option.</p>
<p>The same applies to similar languages like CSS and JSX.</p>
```

```css
.error {
    display: none;
}
```

```jsx
{isExempt && <p>No error here!</p>}
```

````markdown
```javascript
console.log("Flags abbreviated names even with nested code blocks.");
```
````

1. List item

   ```javascript
   console.log("Flags abbreviated names even with indented code blocks.");
   ```

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- KC item

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- AR item
