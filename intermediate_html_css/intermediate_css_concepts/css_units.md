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

Using a relative size like `rem` to define font sizes across your website _is_ recommended. Many browsers allow users to change the base font-size to increase readability. If at all possible, it is advisable to respect a user's wishes regarding font size. You'll learn more about this from the reading assignments.

#### Viewport units

The units `vh` and `vw` relate to the size of the viewport. Specifically, `1vh` is equal to `1%` of the viewport height and `1vw` is equal to `1%` of the viewport width. These can be useful any time you want something to be sized relative to the viewport, examples including full-height heroes, full-screen app-like interfaces.

### Assignment
<div class="lesson-content__panel" markdown="1">
1. [CSS values and units](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Values_and_units) covers all the available units.
2. The article [CSS units](https://codyloyd.com/2021/css-units/) goes in depth on how and when you might want to use `em`, `rem`, or `px`.
3. [Fun with Viewport Units](https://css-tricks.com/fun-viewport-units/) demonstrates some interesting things you can do with `vh` and `vw`.
</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- [Why would you want to use `em` or `rem` for font-size instead of `px`?](#em-and-rem)
- [What are some instances where you might want to use `vh` and `vw`?](#viewport-units)
- [What are some instances where you might want to use `px` instead of a relative unit?](https://codyloyd.com/2021/css-units/)

### Additional resources

This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

* Watch [are you using the right CSS unit?](https://www.youtube.com/watch?v=N5wpD9Ov_To) if you'd like to learn Kevin Powells general rules of thumb when it comes to choosing the correct CSS units for different situations.
