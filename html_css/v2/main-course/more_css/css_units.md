### Introduction
There are many different units that you can use to define sizes in CSS. This lesson will introduce the most important to you, and show you where to learn about the rest of them.

### Learning Outcomes
* You'll learn the difference between relative and absolute units
* You'll learn when its appropriate to use the different units.

### Absolute Units
Absolute units are those that are always the same in any context. `px` is an absolute unit because the size of a pixel doesn't change relative to anything else on the page. In fact, `px` is the only absolute unit you should be using for web projects. The rest of them make more sense in a print setting because they are related to physical units such as `in` (inch) and `cm` (centimeter).

### Relative Units
Relative units are units that can change based on their context. There are several of them that you are likely to encounter and want to use.

#### em and rem
`em` and `rem` both refer to a font size, though they are often used to define other sizes in CSS. You'll see both of them often so we're going to explain both, but as a rule-of-thumb, prefer `rem`.

`em` refers to the `font-size` of an element (or the element's parent if you're using it to set `font-size`). So, for example, if an element's `font-size` is `16px`, then setting it's width to `4em` would make it's width `64px` (`16 * 4 == 64`). 

`rem` refers to the `font-size` of the root element (either `:root` or `html`). The math works the same with `rem` as it did with `em`, but without the added complexity of keeping track of the parent's font size. Relying on `em` could mean that a particular size could change if the context changes, which is very likely not the behavior you want.

Using a relative size like `rem` to define font sizes across your website _is_ recommended. Many browsers allow users to change the base font-size to increase readability. If at all possible, it is advisable to respect user's wishes with regards to font size. One of the reading assignment articles goes into more depth on this.

#### Viewport Units: vw and vh.

The units `vh` and `vw` relate to the size of the viewport. Specifically, `1vh` is equal to `1%` of the viewport height and `1vw` is equal to `1%` of the viewport width. These can be useful any time you want something to be sized relative to the viewport, examples including full-height heroes, full-screen app-like interfaces.

### Assignment
<div class="lesson-content__panel" markdown="1">
1. [CSS values and units](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Values_and_units) covers all the available units.
1. The article [CSS units](https://codyloyd.com/2021/css-units/) goes in depth on how and when you might want to use `em`, `rem`, or `px`.
2. [Fun with Viewport Units](https://css-tricks.com/fun-viewport-units/) demonstrates some interesting things you can use with `vh` and `vw`
</div>

### Practice

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something
* []()

### Knowledge Check
*