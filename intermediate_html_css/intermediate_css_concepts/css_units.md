### Introduction

There are many different units that you can use to define sizes in CSS. This lesson will introduce the most important to you, and show you where to learn about the rest of them.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- You'll learn the difference between relative and absolute units.
- You'll learn when it's appropriate to use the different units.

### Absolute units

Absolute units are those that are always the same in any context. `px` is an absolute unit because the size of a pixel doesn't change relative to anything else on the page. In fact, `px` is the only absolute unit you should be using for web projects. The rest of them make more sense in a print setting because they are related to physical units such as `in` (inch) and `cm` (centimeter).

### Relative units

Relative units are units that can change based on their context. There are several of them that you are likely to encounter and want to use.

#### em and rem

`em` and `rem` both refer to a font size, though they are often used to define other sizes in CSS. You'll see both of them often so we're going to explain both, but as a rule-of-thumb, prefer `rem`.

`1em` is the `font-size` of an element (or the element's parent if you're using it to set `font-size`). So, for example, if an element's `font-size` is `16px`, then setting its width to `4em` would make its width `64px` (`16 * 4 == 64`).

`1rem` is the `font-size` of the root element (either `:root` or `html`). The math works the same with `rem` as it did with `em`, but without the added complexity of keeping track of the parent's font size. Relying on `em` could mean that a particular size could change if the context changes, which is very likely not the behavior you want.

Using a relative size like `rem` to define font sizes across your website *is* recommended. Many browsers allow users to change the base font-size to increase readability. If at all possible, it is advisable to respect a user's wishes regarding font size. You'll learn more about this from the reading assignments.

#### Viewport units

The units `vh` and `vw` relate to the size of the viewport. Specifically, `1vh` is equal to `1%` of the viewport height and `1vw` is equal to `1%` of the viewport width. These can be useful any time you want something to be sized relative to the viewport, examples including full-height heroes, full-screen app-like interfaces.

### So many units!

If you look up all the different units available in CSS, even just for [length units](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/length), you'll see *absolutely loads*. How do you know which one to use and when?

Try not to look for rules for what situations to use what units in. Each unit does a different thing, so just like any other code, think about how you want something to behave and what instructions you want to write, then look into what unit(s) may help you with that.

You may want a certain margin size to be based off (and thus scale with) the root font size, in which case you'd use `rem`. But `rem` for a different margin may not make sense, and you actually want it fixed to a `px` value. Maybe you want this div's width to be half of its parent's, in which case a width of `50%` would make sense, but that div over there you want to be half whatever the viewport width is, in which case `%` would not make sense but `vw` would. You're not going to be memorizing these any time soon, nor would it help much to do so, so don't worry about looking into things when needed (which goes for anything in your programming journey).

### Assignment

<div class="lesson-content__panel" markdown="1">

1. [CSS values and units](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Values_and_units) covers all the available units.
1. The article [CSS units](https://web.archive.org/web/20251130034321/https://codyloyd.com/2021/css-units/) goes in depth on how and when you might want to use `em`, `rem`, or `px`.
1. [Fun with Viewport Units](https://css-tricks.com/fun-viewport-units/) demonstrates some interesting things you can do with `vh` and `vw`.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Why would you want to use `em` or `rem` for font-size instead of `px`?](#em-and-rem)
- [What are some instances where you might want to use `vh` and `vw`?](#viewport-units)
- [What are some instances where you might want to use `px` instead of a relative unit?](https://codyloyd.com/2021/css-units/)
