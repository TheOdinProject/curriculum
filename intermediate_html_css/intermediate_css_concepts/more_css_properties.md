### Introduction
By now, you probably have a strong grasp of the important foundational concepts of CSS, but there is a lot more that you can do with CSS to make some truly spectacular looking websites. It's time to cover those useful little CSS features you can use to add some shine to your projects.

There are a _lot_ of CSS properties. [A Recent CSS Tricks Article](https://css-tricks.com/how-many-css-properties-are-there/) says there are _hundreds_. Luckily, you don't have to memorize them all: the amount of properties you're actually going to use on a daily basis is much smaller. This lesson is going to cover most of the items you'll end up using on a regular basis. The format of this lesson is a little different since it's essentially just a list of CSS properties. We'll give a little description of the property and then link you to some documentation where you can see all the available options.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- You'll learn about a lot of useful CSS properties!

#### Background

You've likely already experimented with setting background colors on things, but the `background` property can do quite a bit more. The `background` property is actually a shorthand for 8 different background-related properties, all of which you can read about in the linked docs. Beyond changing background-colors, you can also specify background images, change the position and size of background images, and change how background images repeat or tile if they are too small to fill their container. It is also possible to have multiple background layers.

One thing to note is that it _is_ possible to use these properties individually, and in some cases it might be easier and more clear to do that than defaulting to the shorthand. This is in contrast to some other shorthand properties where it is almost always preferable to default to using the shorthand (flex, margin, padding etc.)

There's a lot of information in the docs on this shorthand and all the associated properties. As we've mentioned before, you do NOT need to _memorize_ the exact order and syntax of each property. It's enough to know that they exist and have a general idea of what they do.

One more note, the **Formal Syntax** section here is _crazy_. Don't let it deter you. The basic syntax is somewhat hard to define because many of the properties that make up the shorthand are optional, or can come in different places in the definition. Read the [MDN docs on `background`.](https://developer.mozilla.org/en-US/docs/Web/CSS/background)

#### Borders
At this point, you've probably already encountered `border` and `border-radius`. The `border` property is another shorthand, but it is _much_ less complicated than the background shorthand. For borders, basically you just need to define a size, style and color.

`border-radius` is the property that is used to create rounded corners on things. As you'll see in the docs, it's possible to get fancy and define different radii for each corner of an element, but this is rarely useful. Store that information in the category of "things I'll look up if I ever need it".

Read the MDN docs for [`border`](https://developer.mozilla.org/en-US/docs/Web/CSS/border) and [`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius).

#### box-shadow
As you might expect from the property name, `box-shadow` adds a shadow effect around an element. This is useful to create a sense of depth on your page and to add subtle separation between elements.

In usage it's straightforward, but keep in mind that it's best used sparingly, and subtly. Prefer lighter, barely visible shadows to darker or brighter colors.

Read the [`box-shadow` docs](https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow).

#### Overflow
It is possible, using `overflow`, to define what happens to an element when its content is too big to fit. The most common usage is likely to add scrollbars to an element inside a webpage, for example a `card` style element with scrollable content.

Check out the [`overflow` docs](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow).

#### Opacity
Opacity is another easy one that can be very useful in some circumstances.

Check out [`opacity`](https://developer.mozilla.org/en-US/docs/Web/CSS/opacity) for a definition and some examples.

### Knowledge check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- [Which property would you use to make an element transparent?](#opacity)
- [Which property would you use to make a background image tile?](#background)
- [Which property would you use to add scrollbars to an element?](#overflow)
- [Which property would you use to add a shadow behind an element?](#box-shadow)
- [Which property would you use to create rounded corners on an element?](#borders)
- [How would you use border-radius to make a circular element?](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)

### Additional resources

Throughout this lesson we have linked primarily to the MDN docs for each property... however there are _many_ useful reference sites across the web that can be useful and that may show up when searching these items.

* [CSS Tricks](https://css-tricks.com/almanac/properties) has some really great content. Some of it feels less formal and official than the MDN docs, but that means they can be easier to digest.  Sometimes their examples can be more useful. For example, check out their pages on the [background shorthand](https://css-tricks.com/almanac/properties/b/background/), or [overflow](https://css-tricks.com/almanac/properties/o/overflow).
* [W3 Schools](https://www.w3schools.com/cssref/) is another fine resource. We (the Odin authors) tend to prefer MDN, but there is nothing wrong with W3.
