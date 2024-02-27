### Introduction

By now you should be comfortable with basic CSS selectors and have no trouble grabbing things by their type, class or ID. But to be a real CSS surgeon, sometimes you need more specialized tools. In this lesson we'll look at advanced CSS selectors and show you how to target elements in a more specific and finely grained way.

These selectors can be especially useful when you can't (or don't want to) change your HTML markup.

There are *a lot* of advanced selectors, so going through every single one is outside the scope of this lesson. However, we'll go through some of the most useful and common ones, as well as arm you with the concepts and vocabulary to learn more on your own.

As always feel free to open up your code editor and run your own experiments with these selectors - practice makes perfect!

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Understand how to use parent and sibling selectors.
- Recognize the difference between pseudo classes and pseudo elements.
- Learn about some of the most useful and common pseudo elements and pseudo classes.
- Learn about the different ways to select an attribute or its parts.

### Child and sibling combinators

Let's have a look at some more ways we can access different elements *without* referring to their classes. Here are three new selectors to do just that.

- `>` - the child combinator
- `+` - the adjacent sibling combinator
- `~` - the general sibling combinator

We'll tackle some practical examples using this sample markup.

```html
<main class="parent">
  <div class="child group1">
    <div class="grand-child group1"></div>
  </div>
  <div class="child group2">
    <div class="grand-child group2"></div>
  </div>
  <div class="child group3">
    <div class="grand-child group3"></div>
  </div>
</main>
```

By now, you should be pretty comfortable writing rules using the descendant combinator you learned about in [intro to CSS](https://www.theodinproject.com/lessons/foundations-intro-to-css). For instance, if we wanted to select all the `child` and `grand-child` divs inside of `main`, we could write:

```css
main div {
  /* Our cool CSS */
}
```

But what if we wanted to be more specific and <span id="childvdesc-knowledge-check">select *only* the `child` or `grand-child` divs?</span> That's where the child combinator `>` comes in handy. Unlike the descendant combinator, it will only select direct children.

```css
/* This rule will only select divs with a class of child */
main > div {
  /* Our cool CSS */
}

/* This rule will only select divs with a class of grand-child */
main > div > div {
  /* More cool CSS */
}
```

Phrased another way, the child selector will select an element that is one level of indentation down. In order to select an element that is adjacent (immediately following) to our target, or on the same level of indentation, we can use the adjacent sibling combinator `+`.

```css
/* This rule will only select the div with the class child group2 */
.group1 + div {
  /* Our cool CSS */
}

/* This rule will only select the div with the class child group3 */
.group1 + div + div {
  /* More cool CSS */
}
```

Finally, if we want to select all of the siblings following an element's and not just the first one, we can use the general sibling combinator `~`.

```css
/* This rule will select all of .group1's siblings - in this case the 2nd and 3rd .child divs */
.group1 ~ div {
  /* Our cool CSS */
}
```

Just like the descendant combinator, these selectors don't have any special specificity rules - their specificity score will just be made up of their component parts.

This [MDN article on combinators](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Selectors/Combinators) provides a good overview if you want to learn more about them.

### Pseudo-selectors

Before diving into pseudo-selectors, a quick note on the difference between [pseudo-elements and pseudo-classes](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Selectors/Pseudo-classes_and_pseudo-elements). <span id="syntax-exist-knowledge-check">Pseudo-class selectors are prefixed with a single colon and are a different way to target elements that already exist in HTML. Pseudo-elements are prefixed with two colons and are used to target elements that *don't* normally exist in the markup.</span> If that doesn't make sense straight away, don't worry - we'll explore some examples below.

### Pseudo-classes

Pseudo-classes offer us different ways to target elements in our HTML. There are quite a lot of them, and they come in a couple of different flavors. Some are based on their position or structure within the HTML. Others are based on the state of a particular element, or how the user is currently interacting with it. There are too many to cover in detail here but we'll have a look at some of the most useful ones. Pseudo-classes share the same specificity as regular classes (0, 0, 1, 0). Just like regular classes, most can be chained together.

<div class="lesson-note lesson-note--tip" markdown=1>
The (0,0,1,0) above is the notation for calculating specificity. To find out more about how it works, glance over the "Calculating CSS Specificity Value" section from [this article on CSS Specificity](https://css-tricks.com/specifics-on-css-specificity/).
</div>

As always don't forget to check the [docs](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes) to see a complete picture of what's available.

#### Dynamic and user action pseudo-classes

These types of useful pseudo-classes can make your page feel much more dynamic and interactive.

[`:focus`](https://css-tricks.com/almanac/selectors/f/focus/) applies to an element that is currently selected by the user either through selecting it with their cursor or using their keyboard.

<span id="hover-active-knowledge-check">[`:hover`](https://css-tricks.com/almanac/selectors/h/hover/) will affect anything under the user's mouse pointer.</span> It can be used to give extra oomph to buttons and links to highlight that they're interactable, or to trigger a drop-down menu.

[`:active`](https://css-tricks.com/almanac/selectors/a/active/) applies to elements that are currently being clicked, and is especially useful for giving your user feedback that their action had an effect. This is a great one to give your buttons and other interactive elements more 'tactile' feedback.

Have you ever wondered why links are blue but turn purple when clicked in unstyled HTML? It's because browsers implement that styling by default. To implement your own custom styling for links, take advantage of the [`:link`](https://css-tricks.com/almanac/selectors/l/link/) and [`:visited`](https://css-tricks.com/almanac/selectors/v/visited/) pseudo-classes. A simplified version of default browser styling might look something like this:

```css
  /* This rule will apply to all links */
  a {
    text-decoration: underline;
  }

  /* This will apply to unvisited links */
  a:link {
    color: blue;
  }

  /* And you guessed it, this applies to all links the user has clicked on */
  a:visited {
    color: purple;
  }
```

#### Structural pseudo-classes

Structural pseudo-classes are a powerful way to select elements based on their position within the DOM.

[`:root`](https://css-tricks.com/almanac/selectors/r/root/) is a special class that represents the very top level of your document - the one element that has no parents. Generally when working with the web, this is equivalent to the `html` element, but there are a [few subtle differences](https://stackoverflow.com/questions/15899615/whats-the-difference-between-css3s-root-pseudo-class-and-html).

`:root` is generally the place where you will place your 'global' CSS rules that you want available everywhere - such as your custom properties and CSS variables, or rules such as `box-sizing: border-box;`.

<span id="first-child-knowledge-check">[`:first-child`](https://css-tricks.com/almanac/selectors/f/first-child/)</span> and [`:last-child`](https://css-tricks.com/almanac/selectors/l/last-child/) will match elements that are the first or last sibling.

Similarly, [`:empty`](https://css-tricks.com/almanac/selectors/e/empty/) will match elements that have no children at all, and [`:only-child`](https://css-tricks.com/almanac/selectors/o/only-child/) will match elements that don't have any siblings.

For a more dynamic approach we can use <span id="second-child-knowledge-check">[`:nth-child`](https://css-tricks.com/almanac/selectors/n/nth-child/).</span> This is a flexible pseudo-class with a few different uses.

```css
  .myList:nth-child(5) {/* Selects the 5th element with class myList */}

  .myList:nth-child(3n) { /* Selects every 3rd element with class myList */}

  .myList:nth-child(3n + 3) { /* Selects every 3rd element with class myList, beginning with the 3rd */}

  .myList:nth-child(even) {/* Selects every even element with class myList */}
```

### Pseudo-elements

While pseudo-classes give us an alternative way to interact with our HTML elements based on their state or structure, pseudo-elements are more abstract. They allow us to affect parts of our HTML that aren't elements at all. These special elements share the same specificity as regular elements (0, 0, 0, 1). There are a number of useful pseudo-elements that can be utilized in any number of creative ways.

[`::marker`](https://css-tricks.com/almanac/selectors/m/marker/) allows you to customize the styling of your `<li>` elements' bullets or numbers.

[`::first-letter`](https://css-tricks.com/almanac/selectors/f/first-letter/) and [`::first-line`](https://css-tricks.com/almanac/selectors/f/first-line/) allow you to (you guessed it!) give special styling to the first letter or line of some text.

[`::selection`](https://css-tricks.com/almanac/selectors/s/selection/) allows you to change the highlighting when a user selects text on the page.

[`::before` and `::after`](https://css-tricks.com/almanac/selectors/a/after-and-before/) allow us to add extra elements onto the page with CSS, instead of HTML. Using it to decorate text in various ways is one common use case.

```html
<style>
  .emojify::before {
    content: '😎 🥸 🤓';
}

  .emojify::after {
    content: '🤓 🥸 😎';
}
</style>

<body>
  <div> Let's <span class="emojify">emojify</span>this span!</div>
</body>
```

Using these pseudo-elements this way would give us this result:

Let's 😎 🥸 🤓 emojify 🤓 🥸 😎 this span!

 There are lots more! Have a quick browse through the [pseudo-element docs](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements) to see a complete list of what's possible.

### Attribute selectors

The last tool we're going to add to the box is attribute selectors. Recall that an attribute is anything in the opening tag of an HTML element - such as `src='picture.jpg'` or `href="www.theodinproject.com"`.

Since we write our own values for attributes, we need a slightly more flexible system to be able to target specific values.

Attribute selectors have the same specificity as classes and pseudo-classes (0, 0, 1, 0).

Let's look at some examples for basic usage.

- `[attribute]` - This general selector will select anything where the given attribute exists. Its value doesn't matter.
- `selector[attribute]` - Optionally we can combine our attribute selectors with other types of selectors, such as class or element selectors.
- `[attribute="value"]` -<span id="type-text-knowledge-check"> To get really specific, we can use `=` to match a specific attribute with a specific value.</span>

```css
  [src] {
    /* This will target any element that has a src attribute. */
  }

  img[src] {
    /* This will only target img elements that have a src attribute. */
  }

  img[src="puppy.jpg"] {
    /* This will target img elements with a src attribute that is exactly "puppy.jpg" */
  }
```

Sometimes we need to be more general in how we access these attributes. For example, perhaps we're only interested in `img` elements where the `src` attribute's value ends in `.jpg`. For cases like this we have some attribute selectors that allow us to match a part of the attribute's value. If you've ever come across [regular expressions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions) before, these attributes use a similar syntax.

- `[attribute^="value"]` - `^=` <span id="thunder-knowledge-check">Will match strings from the start.</span>
- `[attribute$="value"]` - `$=` Will match strings from the end.
- `[attribute*="value"]` - `*=` The wildcard selector will match anywhere inside the string.

```css
[class^='aus'] {
  /* Classes are attributes too!
    This will target any class that begins with 'aus':
    class='austria'
    class='australia'
  */
}

[src$='.jpg'] {
  /* This will target any src attribute that ends in '.jpg':
  src='puppy.jpg'
  src='kitten.jpg'
  */
}

[for*='ill'] {
  /* This will target any for attribute that has 'ill' anywhere inside it:
  for="bill"
  for="jill"
  for="silly"
  for="ill"
  */
}
```

To see what other things you can achieve with attribute selectors, such as searching case insensitivity, or sub-strings separated by hyphens, have a browse through the [MDN docs](https://developer.mozilla.org/en-US/docs/Web/CSS/Attribute_selectors).

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Complete [CSS Diner](https://flukeout.github.io/). You should be familiar with most of the content in the first couple of exercises, but practice and review never hurt! Don't forget to read the examples and explanations on the right.
2. Read [Shay Howe's article on Complex Selectors](https://learn.shayhowe.com/advanced-html-css/complex-selectors/). This covers most of the content of this lesson in a bit more detail. As stated in their article, they sometimes use a single colon instead of a double one for pseudo-elements. Please keep in mind that the double colon is now the standard.
</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- [What is the difference between the child combinator and the descendant combinator?](#childvdesc-knowledge-check)
- [How does the syntax of pseudo-classes and pseudo-elements differ?](#syntax-exist-knowledge-check)
- [Do pseudo-classes exist somewhere in HTML? Do pseudo-elements?](#syntax-exist-knowledge-check)
- [Name two ways you could select every second child of an element, starting with the first.](#second-child-knowledge-check)
- [What is the difference between `div:first-child` and `div:last-child`? What will each select?](#first-child-knowledge-check)
- [What selector would you use to style a button a user is currently hovering over? How about one that is currently being clicked on?](#hover-active-knowledge-check)
- [How could you select all input elements with a type of text?](#type-text-knowledge-check)
- [How could you select all classes that begin with `thunder`?](#thunder-knowledge-check)

### Additional resources

This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

- [Kevin Powell](https://www.youtube.com/kepowob/search?query=pseudo) has a variety of videos on several of these topics if you'd like a deeper dive.
- [The CSS Tricks Almanac](https://css-tricks.com/almanac/selectors/) has a great reference for all pseudo-elements and selectors. It includes examples, extra resources and browser support charts.
- [W3 Schools](https://www.w3schools.com/cssref/css_selectors.asp) also has a solid, more concise reference list. Includes an interactive selector tool if you'd like to play around with some hands on examples.
- [The Free Code Camp Selector Cheat Sheet](https://www.freecodecamp.org/news/css-selectors-cheat-sheet/) has a solid summary of some of the most common selectors.
- [A nice concise article](https://www.growingwiththeweb.com/2012/08/pseudo-classes-vs-pseudo-elements.html) on the differences between pseudo-classes and pseudo-elements. Also provides a solid summary of the different kinds of selectors.
- [Smashing Magazine on Taming Advanced CSS Selectors](http://coding.smashingmagazine.com/2009/08/17/taming-advanced-css-selectors/)
- [CSS Tricks on Attribute Selectors](https://css-tricks.com/attribute-selectors/) will help if you need a deeper look at attributes.
