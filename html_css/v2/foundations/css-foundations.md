### Introduction

There are a lot of CSS properties and concepts we can use to make some stunning websites and apps, so many that you could code for a year and still discover new properties you've never heard of before. In this lesson we're only going to focus on what we believe are some foundational concepts, things that anyone should know from the beginning, whether they are just starting out or simply need a refresher.

### Learning Outcomes

By the end of this lesson, you should be able to:

* Add CSS to an HTML file
* Add a class and an ID to an HTML element
* Use element, class, and ID selectors
* Group multiple selectors and use combinators
* Understand what the cascade is
* Understand how specificity, inheritance, and rule order work

### Basic Syntax

At the most basic level, CSS is made up of various rules. These rules are made up of a selector (more on these in a bit) and a semi-colon separated list of declarations, with each of those declarations being made up of a property:value pair. The actual syntax will be slightly different depending on which method is used for adding CSS, but generally each method will all follow this structure. 

So, what exactly are these methods?

#### Inline CSS

Inline CSS is when you add styles directly on an HTML element, within the HTML file itself:

~~~html
<body>
  <div style="color: white; background-color: black;">...</div>
</body>
~~~

The first thing to note is that we don't need to worry about using a selector, since the styles are being added directly to the opening `<div>` tag itself. Next we have the `style=` attribute, with its value within the pair of quotation marks being the declarations: `color: white;` is one declaration, with `color` being the property and `white` the value, and `background-color: black;` is another declaration.

If you need to add a *unique* style for a *single* element, this method can work just fine. Generally, though, this isn't exactly the preferred way to add CSS for a few reasons:

* It can get pretty messy pretty quickly once you start adding a *lot* of declarations to a single element, causing your HTML file to become unnecessarily bloated
* If you want multiple elements to have the same style, you would have to copy + paste the same style to each individual element, causing lots of unnecessary repetition and more bloat
* Any inline CSS will override the other two methods, which can cause unexpected results (while we won't dive into it here, this can actually be taken advantage of)

#### Internal CSS

Similar to the inline method, internal CSS (or embedded CSS) also involves adding the CSS within the HTML file itself. The difference with internal CSS, though, is that you place all of the rules inside of a pair of opening and closing `<style>` tags, which are then placed inside of the opening and closing `<head>` tags of your HTML file:

~~~html
<head>
  <style>
    div {
      color: white;
      background-color: black;
    }

    p {
      color: red;
    }
  </style>
</head>
<body>...</body>
~~~

Let's go over the differences here compared to inline CSS. 

First, this is where we have to declare a selector (the `div` and `p` bits). Then we have opening and closing curly braces after the selector, which create a "declaration block". Finally, we place any declarations inside of the declaration block. If we wanted to add other rules, we would just continue adding them inside of the opening and closing `<style>` tags.

This method can be useful for adding unique styles to a *single page* of a website, but it still isn't what many consider to be the preferred method.

#### External CSS

External CSS, aka the preferred method, involves creating a separate file for the CSS and linking it inside of an HTML's opening and closing `<head>` tags:

~~~html
<!-- index.html -->

<head>
  <link rel="stylesheet" href="styles.css">
</head>
~~~
~~~css
/* styles.css */

div {
  color: white;
  background-color: black;
}

p {
  color: red;
}
~~~

First, we add a self-closing `<link>` element inside of the opening and closing `<head>` tags of the HTML file. The `href` attribute is the location of the CSS file, either an absolute URL or, what you'll be utilizing, a URL relative to the location of the HTML file.

Then inside of the newly created `styles.css` file, you'll notice the syntax is basically the same as the internal CSS method. The difference here being we no longer need those `<style>` tags (in fact, there should be no HTML tags within an external CSS file). `styles.css` is just what we went with as the file name here. You can name the file whatever you want as long as the file type is `.css`, though "style" or "styles" is most commonly used.

Why is this the preferred method?

1. It keeps our HTML and CSS separated, which results in the HTML file being smaller and makes things look cleaner
2. We only need to edit the CSS in *one* place, which is especially handy for websites with multiple pages that all have similar styles.

### Selectors

Selectors simply refer to the HTML elements in which CSS rules apply; they're what is actually being "selected" for each rule. The following sub-sections don't cover every selector available, but they're definitely ones you should get comfortable using first.

#### Universal Selector

The universal selector will select elements of any type, hence the name "universal", and the syntax for it is a simple asterisk. In the example below, every element would have the `color: purple;` style applied to it.

~~~css
* {
  color: purple;
}
~~~

#### Type Selectors

A type selector (or element selector) you've already seen, as each code snippet up to this point has used a type selector. This selector will select all elements of the given element type, and the syntax is just the name of the element. Just to make sure it's clear, here's another example:

~~~html
<!-- index.html -->

<div>Hello, World!</div>
<div>Hello again!</div>
<p>Hi...</p>
<div>Okay, bye.</div>
~~~
~~~css
/* styles.css */

div {
  color: white;
}
~~~

Here, all three `<div>` elements would be selected, while the `<p>` element wouldn't be.

#### Class Selectors

Class selectors will select all elements with the given class, which is just an attribute you place on an HTML element. Here's how you would add a class in an HTML file and select it in CSS:

~~~html
<!-- index.html -->

<div class="alert-text">
  Please agree to our terms of service.
</div>
~~~
~~~css
/* styles.css */

.alert-text {
  color: red;
}
~~~

Note the syntax for class selectors: a period immediately followed by the case-sensitive value of the class attribute. Classes aren't required to be unique, so you can use the same class on as many elements as you want.

Another thing you may have noticed is the kebab-case style. We separate a multi-worded class with hyphens because whitespace is reserved for separating a list of several classes on a single element, such as `class="alert-text severe-alert"`. Kebab-case isn't exactly required, but it tends to be the convention that developers opt for.

#### ID Selectors

ID selectors are similar to class selectors. They select an element with the given ID, which is another attribute you place on an HTML element: 

~~~html
<!-- index.html -->

<div id="title">My Awesome 90's Page</div>
~~~
~~~css
/* styles.css */

#title {
  background-color: red;
}
~~~

Instead of a period, we use a hashtag immediately followed by the case-sensitive value of the ID attribute. A common pitfall is people overusing the ID attribute when they don't necessarily need to, and when classes will suffice. While there are cases where using an ID makes sense or is needed, such as taking advantage of specificity or to have links redirect to a section on the current page, you should use IDs **sparingly** (if at all).

The major differences between classes and IDs are that an element can only have **one** ID, an ID cannot be repeated on a single page, and the ID attribute should not contain any whitespace.

#### Grouping Selector

What if we had two groups of elements, each with some unique properties, but also some properties that both groups shared?

~~~css
.read {
  color: white;
  background-color: black;
  /* several unique declarations */
}

.unread {
  color: white;
  background-color: black;
  /* several unique declarations */
}
~~~

Both our `.read` and `.unread` selectors share the `color: white;` and `background-color: black;` declarations, but otherwise have several of their own unique declarations. To cut down on the repetition, we can group these two selectors together as a comma-separated list:

~~~css
.read, 
.unread {
  color: white;
  background-color: black;
}

.read {
  /* several unique declarations */
}

.unread {
  /* several unique declarations */
}
~~~

Both of the examples above (with and without grouping) will have the same result, but the second example reduces repetition of declarations and makes it easier to edit either the `color` or `background-color` for both classes at once.

#### Chaining Selectors

Another way to use selectors is to chain them as a list without any separation. Let's say we had the following HTML:

~~~html
<div>
  <div class="subsection header">Latest Posts</div>
  <p class="subsection preview">This is where a preview for a post might go.</p>
</div>
~~~

We have two elements with the `subsection` class that has some sort of unique styles, but what if we only want to apply a separate rule to the element that also has `header` as a second class? Well, we could chain the two class selectors together in our CSS like so:

~~~css
.subsection.header {
  color: red;
}
~~~

Notice how there isn't any space between the two selectors here. What `.subsection.header` does is it selects any element that has a class name of `subsection` *and* a class name of `header`. This basically works with any combination of selectors except multiple type selectors (since an element can't be two different types at once, and `divp` would try to select a literal `<divp>` element which doesn't exist).

#### Descendant Combinator

Combinators allow us to combine multiple selectors differently than grouping or chaining them, as they show a relationship between the selectors. There are four types of combinators in total, but for right now we're going to only show you the **descendant combinator**, which is represented in CSS by a single space between selectors. A descendant combinator will only cause elements that match the last selector to be selected if they also have an ancestor (parent, grandparent, etc) that matches the previous selector.

So something like `.ancestor .child` would select an element with the class `child` if it has an ancestor with the class `ancestor`. Another way to think of it is `child` will only be selected if it is nested inside of `ancestor`, no matter how deeply. Take a quick look at the example below and see if you can tell which elements would be selected based on the CSS rule provided:

~~~html
<!-- index.html -->

<div class="ancestor"> <!-- A -->
  <div class="contents"> <!-- B -->
    <div class="contents"> <!-- C -->
    </div>
  </div>
</div>

<div class="contents"></div> <!-- D -->
~~~
~~~css
/* styles.css */

.ancestor .contents {
  /* some declarations */
}
~~~

In the above example, the first two elements with the `contents` class (B and C) would be selected, but that last element (D) won't be. Was your guess correct?

There's really no limit to how many combinators you can add to a rule, so `.one .two .three .four` would be totally valid. This would just select an element that has a class of `four` if it has an ancestor with a class of `three`, and if that ancestor has its own ancestor with a class of `two`, and so on. You generally want to avoid trying to select elements that require this level of nesting, though, as it can get pretty confusing and long, and it can cause issues when it comes to specificity. Speaking of which...

### The Cascade of CSS

Sometimes we may have rules that conflict with one another, and we end up with some unexpected results. "But I wanted *these* paragraphs to be blue, why are they red like these other paragraphs?!" As frustrating as this can be, it's important to understand that CSS doesn't just *do* things against our wishes. CSS only does what we tell it to do. One exception to this is the default styles that are provided by a browser. These default styles vary from browser to browser, and they are why some elements create a large "gap" between itself and other elements, or why buttons look the way they do, despite us not writing any CSS rules to style them that way.

So if you end up with some unexpected behavior like this it's either because of these default styles, or due to not understanding how a property works or not understanding this little thing called the cascade. 

The cascade is what determines which rules actually get applied to our HTML. There are different factors that the cascade uses to determine this, three of which we'll go over to hopefully help you avoid (as many of) those frustrating "I hate CSS" moments.

#### Specificity

Remember earlier how we mentioned that inline CSS overrides internal and external CSS? That's because inline CSS has a higher *specificity*. The style is directly on the element itself, and it's hard to get more specific than that.

When it comes to internal and external CSS, each type of selector has its own specificity level (there are other selectors that make up the following list, but we're focusing on the ones mentioned in this lesson):

1. ID selectors (most specific, after inline CSS)
2. Class selectors
3. Type selectors
4. Universal selector and combinators (no specificity)

Specificity will only be taken into account when an element has multiple rules targeting it, sort of like a tie-breaker. Ignoring universal selectors and combinators, the other types of selectors will increase the specificity of a rule for that selector's level.

Specificity is represented by a comma-separated list of numbers: `0, 0, 0`. Starting from the left, each number represents the three specificity levels (id, class, and type), with each number having a higher precedence than the next (ID beats all, class beats type and no specificity, type beats anything left over). 

Think of specificity as a sort of scoreboard. If an ID selector is used, the "score" becomes `1, 0, 0`, whereas if a type selector is used the "score" becomes `0, 0, 1`. We would then compare the specificity of each rule to see which one wins; in this case the ID selector would win because `1, 0, 0` is a higher "score" than `0, 0, 1` (ID beats type).

Take a look at the example below, and see if you can determine which rule would be applied:

~~~css
/* rule 1 */
#main {
  color: blue;
}

/* rule 2 */
.subsection .list {
  color: red;
}
~~~

Do you have an answer ready? Are you sure? Okay. In this example, rule 1 only has an ID selector, so its specificity is `1, 0, 0`, while rule 2 has a specificity of `0, 2, 0` because it has two class selectors. In this case, rule 1 would win. Another way to look at this list of numbers is just as a normal number: 100 is a higher number than 020.

Quick note: you can actually view this specificity in VS Code when you hover over a selector in a CSS file!

#### Inheritance

There are some CSS properties that, when applied to an element, will be inherited by descendants of that element, while other properties don't get inherited. An example of a property that *is* inherited is the `color` property. If `color: red` were applied to an element, any descendants of that element would inherit that same `color` property.

The exception to this is when directly targeting an element, as this always beats inheritance:

~~~html
<!-- index.html -->

<div id="parent">
  <div class="child"></div>
</div>
~~~
~~~css
/* styles.css */

#parent {
  color: red;
}

.child {
  color: blue
}
~~~

Despite the `parent` element having a higher specificity with an ID, the `child` element would have the `color: blue` style applied since that declaration directly targets it, while `color: red` from the parent is only inherited.

#### Rule Order

The final factor, the end of the line, the tie-breaker of the tie-breaker. Lets say that after every other factor has been taken into account, there are still multiple conflicting rules targeting an element. How does the cascade determine which rule to apply?

Really simply, actually. Whichever rule was *last* defined is the winner.

~~~css
/* styles.css */

.alert {
  color: red;
}

.warning {
  color: yellow;
}
~~~

For an element that has both the `alert` and `warning` classes, the cascade would run through every other factor, including inheritance (none here) and specificity (a tie of `0, 1, 0`). Since the `.warning` rule was the last one defined, and no other factor was able to determine which rule to apply, it's the one that gets applied to the element.

### Properties to Get Started With

We've gone over a lot so far, although in the grand scheme of things it's almost a fraction of what's out there. Now we're going to mention some CSS properties that you're going to be using all the time, or at the very least more often than not. This is by no means a complete list of properties in CSS, but learning these will be enough to get started with.

#### `color` and `background-color`

The `color` property sets an element's text color, while `background-color` sets, well, the background color of an element. I guess we're done here?

Almost. Both of these properties can accept one of several kinds of values. A common one is a keyword, such as an actual color name like `red` or the `transparent` keyword. They also accept HEX (`#ff0000`), RGB (`rgb(255, 0, 0)`), and HSL (`hsl(0, 100%, 50%)`) values, which you may be familiar with if you've ever used a photoshop program or a site where you could customize your profile colors.

Take a quick look at [CSS Legal Color Values](https://www.w3schools.com/cssref/css_colors_legal.asp) to see how you can adjust the opacity of these colors by adding an alpha value.

#### Typography Basics and `text-align`

`font-family` can be a single value or a comma-separated list of values that determine what font an element uses. Each font will fall into one of two categories, either a "font family name" like `"Times New Roman"` (we use quotes due to the whitespace between words) or "generic family name" like `sans-serif` (generic family names never use quotes).

If a browser cannot find or does not support the first font in a list, it will use the next one, then the next one and so on until it finds a supported and valid font. This is why it's best practice to include a list of values for this property, starting with the font you want to be used most and ending with a generic font family as a fallback, e.g. `font-family: "Times New Roman", sans-serif;`

`font-size` will, as the property name suggests, set the size of the font. When giving a value to this property, the value should not contain any whitespace, e.g. `font-size: 22px` has no space between "22" and "px".

`font-weight` affects the boldness of text, assuming the font supports the specified weight. This value can be a keyword, e.g. `font-weight: bold`, or a number between 1 and 1000, e.g. `font-weight: 700` (the equivalent of `bold`). Usually the numeric values will be in increments of 100 up to 900, though this will depend on the font.

`text-align` will align text horizontally within an element, and you can use the common keywords you've most likely come across in word processors as the value for this property, e.g. `text-align: center`.

#### Image Height and Width

Images aren't the only elements that we can adjust the height and width on, but we want to focus on them specifically in this case.

By default, an `<img>` element's `height` and `width` values will be the same as the actual image file's height and width. If you wanted to adjust the size of the image without causing it to lose its proportions, you would use a value of "auto" for the `height` property and adjust the `width` value:

~~~css
img {
  height: auto;
  width: 500px;
}
~~~

It's best to include both of these properties for `<img>` elements, even if you don't plan on adjusting the values from the image file's original ones. Otherwise if an image takes longer to load than the rest of the page contents, the image won't take up any space on the page at first, but will suddenly cause a drastic shift of the other page contents once it does load in. Explicitly stating a `height` and `width` prevents this from happening, as space will be "reserved" on the page and will just appear as a blank space until the image loads.

### Practice

<!-- Ideas for possible exercises for the css-exercises repo, if needed:

Provide a few different "desired outcome" images that would require the user to:
- Add styles to 3 different elements, each using a different method for adding CSS to an HTMl file (inline, internal, external)
- Add a class and ID to elements and add styles to them using class and ID selectors
- Add a CSS rule that groups two elements, then add a unique rule for each element
- Add a CSS rule that chains two selectors and a rule using the descendant combinator
- Provide a small, completed HTML and CSS file where the user has to fix specificity and/or rule order issues -->

Remember the Recipe page you created as practice from the previous lesson? Well, it's rather *plain* looking, isn't it? Let's fix that by adding some CSS to it!

It's completely open to how you actually style it, but you should use the external CSS method (for this practice and moving forward). You should also try to use several of the properties mentioned in the section above (color, background color, typography properties, etc). Most of all, don't worry about whether what you create looks like it came out of 1995. This is just to practice and get used to writing CSS, not to make something to show off on your resume (and really were sites in the 90's that bad?).

We haven't covered how to use a custom font for the `font-family` property yet, so for now take a look at [CSS Fonts](https://www.w3schools.com/Css/css_font.asp) for a list of generic font families to use, and [CSS Web Safe Fonts](https://www.w3schools.com/cssref/css_websafe_fonts.asp) for a list of fonts that are web safe. Web safe means that these are fonts that are installed on basically every computer or device (but be sure to still include a generic font family as a fallback).

### Knowledge Check
* What are the main differences between inline, internal, and external CSS?
* What is the syntax for class and ID selectors?
* How would you apply a single rule to two different selectors?
* Given an element that has an id of `title` and a class of `primary`, how would you use both attributes for a single rule?
* What does the descendant combinator do?
* Between a rule that uses one class selector and a rule that uses three type selectors, which rule has the higher specificity?

### Additional Resources

* [The CSS Cascade](https://wattenberger.com/blog/css-cascade) is a great, interactive read that goes a little more in detail about other factors that affect what CSS rules actually end up being applied. 
* [Changing the Font Family](https://www.bitdegree.org/learn/font-family-css#how-to-use-a-downloaded-font) goes over a few different ways on how to use custom fonts.