### Introduction

This file should flag with TOP007 errors, and no other linting errors.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- LO item

### Assignment

<div class="lesson-content__panel" markdown="1">

Assignment section

</div>

#### Custom section

[Markdown links are desired in most cases](#custom-section)

<a href="#custom-section">Link should flag as we should be using a markdown link instead</a>.

<a href="#custom-section">Will flag</a> if <a href="#assignment">multiple anchors</a> in same line.

`<a href="#custom-section">Anchors inside an inline code block are ignored</a>`

```html
<a href="#custom-section">Anchors inside fenced code blocks are ignored</a>
```

<p class="codepen" data-height="400" data-default-tab="html,result" data-slug-hash="MWoyBzR" data-editable="true" data-user="TheOdinProjectExamples" style="height: 400px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">

<!-- Does not flag anchor tags for codepen embeds -->
<span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/MWoyBzR">
flex-alignment example</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
on <a href="https://codepen.io">CodePen</a>.</span>

</p>

<!-- But will flag codepen anchors if they're not inside p.codepen -->
<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>

<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- <a class="knowledge-check-link" href="#knowledge-check">Flags with and omits non-href attributes</a>

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- AR item
