### Introduction

Todo

By now you should be comfortable with basic CSS selectors.

These selectors can be especially useful when you can't (or don't want to) change your HTML markup.

As always feel free to open up you editor and run you own experiments with these rules - practice makes perfect!

### Learning Outcomes

* Understand how to use parent and sibling selectors
* Recognise the difference pseudo classes and pseudo elements
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

Todo

## Pseduo Elements

Todo

[MDN - Selectors](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Selectors)
[MDN - Pseudo-classes and pseudo-elements](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Selectors/Pseudo-classes_and_pseudo-elements)

### Attribute Selectors

Todo

[general]
A[general]
begins with
ends with
wildcard
or |

### Assignment
<div class="lesson-content__panel" markdown="1">
1. Complete [CSS Diner](https://flukeout.github.io/). You should be familiar with most of the content in the first couple of exercises, but practice and review never hurt!
</div>

### Additional Resources

This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

- [Shay Howe on Complex Selectors](https://learn.shayhowe.com/advanced-html-css/complex-selectors/) - A similar but slightly more detailed look at the content of this lesson.
- [The differences between a pseudo-class and a pseudo-element](https://stackoverflow.com/questions/8069973/what-is-the-difference-between-a-pseudo-class-and-a-pseudo-element-in-css)

### Knowledge Check

### End --------------- Remove this and everything below before publishing

### Lesson Notes

- Should :root get a special mention? Are CSS variables being covered elsewhere?

## Potential links

* [Pseduo Classes vs Pseudo Elements](https://www.growingwiththeweb.com/2012/08/pseudo-classes-vs-pseudo-elements.html)

* [W3 Schools Selector Reference](https://www.w3schools.com/cssref/css_selectors.asp)
Note - has a selector tool which could be a good practice assignment.

* [CSS Tricks Selectors Reference](https://css-tricks.com/almanac/selectors/) - each link has a good amount of detail

* [Shorter cheat sheet from FCC](https://www.freecodecamp.org/news/css-selectors-cheat-sheet/)
* [CSS Cheat Sheet](https://websitesetup.org/wp-content/uploads/2019/11/wsu-css-cheat-sheet-gdocs.pdf)
