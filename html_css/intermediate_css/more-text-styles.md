### Introduction
You've already done a bit of text-manipulation in our Foundations lessons. This lesson will cover a few more useful css properties that can be used when working with text.

### Learning Outcomes
* You'll learn how to use custom fonts on your web projects.
* You'll learn some more text-related css properties.

### Fonts
In our foundations lesson, we covered changing the `font-family` of an element, but there is some nuance and detail that we left out at the time.

#### The System Font Stack
 If you use the `font-family` property to change to a font like `impact` or `Times New Roman`, and those fonts do not happen to be installed on your user's computer, then a fallback font will be displayed.  If you have not defined a fallback, then the default HTML font will be used, which is often somewhat ugly. For this reason, it's common to see somewhat long stacks of fonts listed on projects. 

One popular stack is this 'system font' stack. [Source: CSS Tricks](https://css-tricks.com/snippets/css/system-font-stack/)

~~~css
body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
}
~~~

The point of this somewhat ridiculous string of font-families is to try using the default font of the system's user interface. It will go through each of those fonts until it finds one that is installed on the system, and then use that. Using a stack like this often produces pleasing results, especially if you're going for a somewhat 'neutral' font style.

#### Online Font Libraries
One popular and easy method to get fonts that are _not_ installed on a user's computer is to use an online font library like [Google Fonts](https://fonts.google.com/), [Font Library](https://fontlibrary.org/) or the premium, but non-free [Adobe Fonts](https://fonts.adobe.com/).

To use a font from one of these libraries, go to the website, select a font and then copy a snippet from the website to import that font from their server into your website. You'll be given either a `<link>` tag to put in your HTML like so....

~~~html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
~~~

... or an `@import` tag that can be dropped at the top of a CSS file.

~~~css
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
~~~

Either method will import that font and make it available for you to use in your CSS:

~~~css
body {
  font-family: 'Roboto', sans-serif;
}
~~~

Keep in mind that it's important to add a fallback font.  If you're linking to an external API, you have no guarantee that the URL won't change, or that the external API won't go down at some point. Having a reasonable fallback means that if something goes wrong, at least your site won't look completely broken.

#### Downloaded Fonts
It is also possible to use a font that you have downloaded from the web. In your CSS file, you import and define a custom font using the `@font-face` rule, and then use as you would any other font-family.

~~~css
@font-face {
  font-family: my-cool-font;
  src: url(../fonts/the-font-file.woff);
}

h1 {
  font-family: my-cool-font, sans-serif;
}
~~~

This method _may_ be more reliable than relying on an third-party font API, but it is always wise to include a fallback.

### Text Styles
You learned the basics of manipulating fonts in our foundations lessons, but there is quite a bit more that you can do with CSS when it comes to manipulating text styles. These rules are all relatively simple and self-explanatory. You can refer to the docs for any questions you might have.

#### font-style
Typically used to make a font italic. You learned about the HTML `<em>` tag which uses an italic font, but `<em>` _also_ signifies that the text it wraps is significant, or should be emphasized in some way. A good rule of thumb to follow is that if you just want text to be italic (or bold, underlined, highlighted, etc.), use a CSS property. Otherwise if text should have some sort of semantic emphasis, use the correct HTML element. For example, if you want all your header text to be italic you should use `font-style` to accomplish this. If you want some text in the _middle of a sentence_ to appear italic in order to emphasize that text, it is appropriate to use an `em` element.

~~~css
h1 {
  font-style: italic;
}
~~~

#### letter-spacing
Letter spacing does what you would expect.... it changes the space between letters in a word. This can be useful for adjusting custom fonts that you feel have too much or too little space. Can also be aesthetically pleasing in some cases, like headers.

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="MWomjGr" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/MWomjGr">
  Letter Spacing | CSS Text Styles</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

Obviously, use this sparingly and with care. Do not make your site hard to read!

#### line-height
Line height adjusts the space between lines in wrapped text. Adding a little line-height can increase readability

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="vYZmXzY" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/vYZmXzY">
  Line Height | CSS Text Styles</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

#### text-transform
Text transform simply changes the case of the given text. You can use this, for example, to force your heading tags to be all uppercase, or to capitalize every word.

Usage is simple, and can be seen in the clear example on these [MDN web docs](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform)

#### text-shadow
As you might expect, `text-shadow` adds a shadow around the text in the selected element. This one is best used sparingly, but can be used to great effect in headings or other presentational text.

The examples on the [MDN reference page for text-shadow](https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow) show how to use it.

#### ellipsis
This one isn't a single property, but it's a useful trick to keep in your toolbox. With the `text-overflow` property, you can truncate overflowing text with an ellipsis. Making an overflow happen, however, requires the use of a couple other properties because the default behavior of text simply printing outside its container isn't technically considered an `overflow` (that's confusing, we know.  Sorry.)

The full snippet is:

~~~css
.overflowing {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
~~~

You can see more detail and an example in [this CSS Tricks Article](https://css-tricks.com/snippets/css/truncate-string-with-ellipsis/).  (Be ready to go look that article up every time you want to use this.)

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

### Knowledge Check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- <a class="knowledge-check-link" href='#online-font-libraries'>What are the 2 ways to add fonts that are not installed on a user's computer?</a>
- <a class="knowledge-check-link" href='#the-system-font-stack'>What is the 'system font stack' and why would you want to use it?</a>
- <a class="knowledge-check-link" href='#letter-spacing'>Which property would you use to increase or decrease the space between letters in a word?</a>
- <a class="knowledge-check-link" href='#line-height'>Which property would you use to increase or decrease the space between lines in a paragraph?</a>
