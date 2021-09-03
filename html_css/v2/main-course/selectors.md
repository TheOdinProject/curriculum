### Introduction

By now you should be comfortable with basic CSS selectors and have no trouble grabbing things by their type, class or ID. But to be a real CSS surgeon, sometimes you need more specialised tools. In this lesson we'll look at advanced CSS selectors and show you how to target elements in a more specific and finely grained way.

These selectors can be especially useful when you can't (or don't want to) change your HTML markup.

As always feel free to open up your code editor and run you own experiments with these selectors - practice makes perfect!

### Learning Outcomes

* Understand how to use parent and sibling selectors
* Recognise the difference between pseudo classes and pseudo elements
* Learn about some of the most useful and common pseudo elements and pseudo classes
* Learn about the different ways to select an attribute or its parts

### Parent and Sibling Selectors

Let's have a look at some ways we can access different divs _without_ referring to their classes. Here are three new seclectors to do just that.

* `>` - the child selector
* `+` - the adjacaent sibling selector
* `~` - the general sibling selector

We'll tackle some practical examples using this sample markup.

~~~html
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
~~~

You should be pretty comfortable by now writing rules using the descendant selector. For instance, if we wanted to select all the `child` and `grand-child` divs inside of `main`, we could write:

~~~css
main div {
  /* Our cool CSS */
}
~~~

But what if we wanted to be more specific and select _only_ the `child` or `grand-child` divs ? That's where the child selector `>` comes in handy. Unlike the descendant selector, it will only select direct children.

~~~css
/* This rule will only select divs with a class of child */
main > div {
  /* Our cool CSS */
}

/* This rule will only select divs with a class of grand-child */
main > div > div {
  /* More cool CSS */
}
~~~

Phrased another way, the child selector will select an element that is one level of indentation down. In order to select an element that is adjacaent to our target, or on the same level of indentation, we can use the adjacaent sibling selector `+`.

~~~css
/* This rule will only select the div with the classes child group2 */
.group1 + div {
  /* Our cool CSS */
}

/* This rule will only select the div with the classes child group3 */
.group1 + div + div {
  /* More cool CSS */
}
~~~

Finally, if we want to select all of an element's siblings and not just the first one, we can use the general sibling selector `~`.

~~~css
/* This rule will select all of .group1's siblings - in this case the 2nd and 3rd .child divs*/
.group1 ~ div {
  /* Our cool CSS */
}
~~~

### Pseudo-Selectors

Before diving into pseudo-selectors, a quick note on the difference between pseudo-elements and pseudo-classes. Pseudo class selectors are prefixed with a single colon and are a different way to target elements that already exist in HTML. Pseudo elements are prefixed with two colons and used to target elements that _don't_ normally exist in the markup. If that doesn't make sense staight away, don't worry - we'll explore some examples below.

## Pseudo Classes

Pseudo-classes offer us different ways to target elments in our HTML. Broadly, we can split them into two different types - dynamic and structural.

Dynamic pseudo-classes are generally a way to interact with elements based on their state. One of the most common applications for this is styling links.

Have you ever wondered why links are blue but turn purple in unstyled HTML? It's because broswers implement that styling by default. A simplified version of how they might do that could look like this.

~~~css
  /* This rule will apply to all links */
  a {
    font-size: 18px;
  }

  a:link {
    color: blue;
  }

  a:visited {
    color: purple;
  }
~~~

* Cover the most common / useful ones, add a reference to a larger list - see links at bottom for candidates
* dynamic ie :hover, :link, :visited, :active, :focus
* structural ie :nth-child, :first-of-type, :root
* other - :not(X), :target, :lang


## Pseduo Elements

Pseudo elements give us a way to interact with

They have the same specificty as normal elements (0,0,0,1).



* `::before` and `::after` allow us to add extra elements onto the page with CSS, instead of HTML. Using it to decorate text in various ways is one common use case.

~~~html
<style>
  .emojify::before {
  content: '😎 🥸 🤓';
}

.emojify::after {
  content: '😎 🥸 🤓';
}
</style>
<body>
  <div> Let's <span class="emojify">emojify</span>this span!</div>
</body>
~~~

Using `::before` and `::after` this way would give us this result: Let's 😎 🥸 🤓 emojify 😎 🥸 🤓 this span!


* ::first-letter / ::first-line
* ::marker
* ::selection

[MDN - Selectors](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Selectors)
[MDN - Pseudo-classes and pseudo-elements](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Selectors/Pseudo-classes_and_pseudo-elements)

### Attribute Selectors

The last tool we're going to add to the box is attribute selectors. Recall that an attribute is simply anything in the opening tag of an HTML element - such as `img='picture.jpg'` or `href="www.theodinproject.com`. Since we write our own values for attributes, we need a slightly more flexible system to be able to target specific values.

Attribute selectors have the same specificty as classes and pseudo-classes (0,0,1,0).

Let's look at some examples for basic usage.

* `[attribute]` - This general selector will select anything where the given attribute exists. It's value doesn't matter.
* `selector[attribute]` - Optionally we can combine our attribute selectors with other types of selectors, such as class or element selectors.
* `[attribute="value"]` - To get really specific, we can use `=` to match a specific attribute with a specific value.

~~~css
  [src] {
    /* This will target any element that has a src attribute. */
  }

  img[src] {
    /* This will only target img elements that have a src attribute. */
  }

  img[src="puppy.jpg"] {
    /* This will target img elements with a src attribute that is exactly "puppy.jpg" */
  }
~~~

Sometimes we need to be more general in how we access these attributes. For example, perhaps we're only interested in `img` elements where the `src` attribute's value ends in `.jpg`. For cases like this we have some attribute selectors that allow us to match a part of the attribute's value. If you've ever come across [regular expressions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions) before, these attributes use a similar syntax.


* `[attribute^="value"]` - `^=` Will match strings from the start,
* `[attribute$="value"]` - `$=` Will strings from the end,
* `[attribute*="value"]` - `*=` The wildcard selector will match anywhere inside the string.

~~~css
[class^='aus'] {
  /* This will target class attributes that begin with 'aus':
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
~~~

To see what other things you can achieve with attribute selectors, such as searching case insensitively, or sub-sstrings separated by hyphens have a browse through the [MDN docs](https://developer.mozilla.org/en-US/docs/Web/CSS/Attribute_selectors).



### Assignment
<div class="lesson-content__panel" markdown="1">
1. Complete [CSS Diner](https://flukeout.github.io/). You should be familiar with most of the content in the first couple of exercises, but practice and review never hurt! Don't forget to read the examples and explanations on the right.
2. Read [Shay Howe's article on Complex Selectors](https://learn.shayhowe.com/advanced-html-css/complex-selectors/).
</div>

### Additional Resources

This section contains helpful links to other content. It isn't required, so consider i  t supplemental for if you need to dive deeper into something.

* [Kevin Powell](https://www.youtube.com/kepowob/search?query=pseudo) has a variety of videos on several of these topics if you'd like a deeper dive.
* [The CSS Tricks Alamanc](https://css-tricks.com/almanac/selectors/) has a great reference for all pseudo-elements and selectors. It includes examples, extra resources and browser support charts.
* [W3 Schools](https://www.w3schools.com/cssref/css_selectors.asp) also has a solid, more concise reference list. Includes a an interactive selector tool if you'd like to play around with some hands on examples.
* [The Free Code Camp Selector Cheat Sheet](https://www.freecodecamp.org/news/css-selectors-cheat-sheet/) has a solid summary of some of the most common selectors.


### Knowledge Check

* How would you select a div inside a div inside a div? REDO
* What is the difference between `div:first-line` and `div :first-line` What will each select?
* How could you select all input elements with a type of text?


### End --------------- Remove this and everything below before publishing

### Lesson Notes

- Should :root get a special mention? Are CSS variables being covered elsewhere?
- Touch on specificity rules of these?
- Delete prettier file before PR
- A note on old syntax? (: vs ::)

## Potential links

* [CSS Cheat Sheet](https://websitesetup.org/wp-content/uploads/2019/11/wsu-css-cheat-sheet-gdocs.pdf)

## Potential in lesson notes

- * [Difference between :root and html](https://stackoverflow.com/questions/15899615/whats-the-difference-between-css3s-root-pseudo-class-and-html)
