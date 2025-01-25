### Introduction

Meaningful text is pretty straight forward: when a user reads text or has it announced to them, they should be able to immediately understand what it means even without any surrounding context. A lack of meaningful text can affect all users, but especially those who rely on assistive technologies. In this lesson we'll be going over a few instances where you should start making sure you provide meaningful text to users.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Know how to provide meaningful links.
- Know how to provide meaningful text in forms.
- Know how to provide meaningful `alt` attributes for images.

### Links

Let's take a look at two different examples of a link:

```html
<!-- Example 1: Where's "here"? -->
<a href='...'>Click here</a> to start your career in web development!

<!-- Example 2: I love that place! -->
Visit <a href='...'>The Odin Project</a> to start your career in web development!
```

To a sighted user, the link in Example 1 makes perfect sense. However, in addition to being able to navigate a page via landmarks and headings (as mentioned in the Semantic HTML lesson), a screen reader may be able to navigate between each element of a specific type, such as links. If a user were to navigate between all of the links on a page, the only thing that would get announced in Example 1 is, "Click here, link." Where's "here" exactly? Without any surrounding context, the link is meaningless. Not only that, but if you have multiple links on a page with that same text content, then users will be told to "click here" many times.

The link in Example 2, however, not only makes sense in context for all users, but it also makes sense *out of context* for screen reader users when it gets announced: "The Odin Project, link."

<span id="meaningful-links-rules">When you add links to a page, there are a few rules you should be following:</span>

1. Make sure that the text content of the `<a>` element somehow indicates where the link redirects to and that it's brief (around 100 characters). So avoid using phrases like "click here" or "this page".
1. If a link would open or download a file, include text that tells the user what kind of file it is as well as the file size.
1. If a link would automatically open in a new tab or window with the `target="_blank"` attribute, you should indicate this to the user in some way.

```html
<!-- Example 1: Now the user is aware that this link will open or download a PDF file. -->
<a href='...'>2021 Sign Up Statistics (PDF, 1MB)</a>

<!-- Example 2: And now the user knows this link opens in a new tab! -->
<a href='...'>GitHub (opens in new tab)</a>
```

The next time you need to use links, try saying the contents of the element out loud to yourself. Does it reasonably indicate where that link would take you, such as the title of the page, article, or video? Are you aware whether it'll open in a new tab automatically or not, or that it'll open a download dialog? If you've been testing out using a screen reader up to this point, then an even better way to test whether a link has meaningful text is with the screen reader itself!

### Forms

Providing meaningful errors to users when they are filling out or submitting a form can turn the experience from frustrating to... well, maybe not fun, but at the very least just a bit less frustrating. Let's take a look at a few error examples, ranging from not helpful at all to very helpful:

```html
<!-- Example 1: Huh? -->
<div class='input-error'>Error: Invalid input.</div>

<!-- Example 2: That makes more sense. -->
<div class='input-error'>Error: Email is invalid.</div>

<!-- Example 3: Even better! -->
<div class='input-error'>Error: 'JohnSmith@@test.com' is not valid. Example of a valid email: example@yourdomain.com.</div>
```

Even if you could tell what input caused the error in Example 1, which may not always be the case, the error doesn't provide any meaningful text. What input is invalid? Why is it invalid? How can you fix it? None of these questions are answered. Now imagine how meaningless this error must be to users of assistive technologies, who may not be able to see where an error is rendered on the page and may only have "invalid input" announced to them.

The error in Example 2 clearly tells you what input is invalid, so you now know exactly where to go. While this might be all a user needs to know, it's worth keeping in mind that it is still a rather vague error. We don't know *why* our email is invalid.

The error in Example 3 is even more meaningful. It not only tells you what input is invalid, but also how to fix the error. <span id="meaningful-error-msg">Generally when you inform a user of a form error, you should be informing them what input caused the error and, when possible, how to fix the error or why the error occurred in some way.</span>

Another way to provide meaningful text in forms is with instructions, such as when a password input lists any characters that the password must contain ("Must include at least one uppercase letter and one number..."). For instructions that are unique to an input, they should be placed alongside the input itself. Instructions that are more global across the form, such as indicating which inputs are required, should either be placed at the top of the form ("* indicates a required field"), or placed alongside the input or its label ("Name (required)").

### Alternative text

At this point you should be pretty familiar with the `alt` attribute on `img` elements. Whether you are or not, let's see if you can tell which of the following examples is valid:

```html
<!-- Example 1 -->
<img src='...' alt='' />

<!-- Example 2 -->
<img src='...' alt='Odin' />
```

Believe it or not, both examples above are valid! While Example 1 doesn't actually have any meaningful text (perhaps a meaningful *lack of* text), you should still understand its importance. <span id="empty-alt-attribute">When you're using an image purely for decoration, or the image just isn't really important for the user to be aware of, you generally don't want users of assistive technologies to be made aware of it.</span> In those cases, you should **always** use an empty string for the value of the `alt` attribute as seen in Example 1 (this is also known as a null value, not to be confused with the JavaScript data type). If you omitted the `alt` attribute, the presence of the image could still be announced, which may confuse the user (especially if the file name was a random string of letters and numbers).

For Example 2, the screen reader would announce, "Odin, graphic", making the user aware that there's an image and what it's an image of. What the alternative text should be for an image will ultimately depend on various factors, though.

### Assignment

<div class="lesson-content__panel" markdown="1">

  1. Read [Alternative Text - WebAIM](https://webaim.org/techniques/alttext) to learn about when and how you should be adding alternative text for images based on the function of the image and the context surrounding it.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What are three rules you should follow in order to provide meaningful links?](#meaningful-links-rules)
- [What information should you inform users of in order to provide meaningful error messages in forms?](#meaningful-error-msg)
- [When should you use the empty string/null value for the `alt` attribute?](#empty-alt-attribute)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [Making Accessible Links: 15 Golden Rules For Developers](https://www.sitepoint.com/15-rules-making-accessible-links/) is a little old, but is still a great list of 15 rules for creating, well, accessible links. Some of the rules the article goes over were mentioned in this lesson, but there are some other rules that can help make sure you're creating a11y friendly links.
- [Usable and Accessible Form Validation and Error Recovery](https://webaim.org/techniques/formvalidation/) goes over a few different ways you can provide errors to users (using the `alert` in JavaScript, providing all errors at the top of the page, and using inline errors), as well as the pros and cons of each.
