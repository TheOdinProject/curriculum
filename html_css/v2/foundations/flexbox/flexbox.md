### Introduction
As you'll learn, there are _many_ ways to move elements around on a webpage. Over the years new methods have been developed, and older things have fallen out of style. Flexbox is a [relatively new](https://medium.com/@BennyOgidan/history-of-css-grid-and-css-flexbox-658ae6cfe6d2) way of manipulating elements in CSS, and when it was introduced it was _revolutionary_.

Because it is somewhat new as a technology, many resources put it near the end of their curriculum, but at this point, it has become the default way of positioning elements for many developers. Flexbox will be one of the most used tools in your toolbox, so why not learn it first?

### Learning Outcomes
* You will learn how to position elements using flexbox.
* You will learn about flex-containers and flex-children.
* You will learn how to create useful components and layouts that go beyond just stacking and centering items.

### Let's Flex!

Flexbox is a way to arrange items into rows or columns where those items will flex (i.e. grow or shrink) based on some simple rules that you can define. To get started, let's look at a simple demonstration.  Copy this HTML and CSS into a file (a repl.it project or codepen is also fine) and view it in a browser.

~~~html
<div class="flex-container">
  <div class="one"></div>
  <div class="two"></div>
  <div class="three"></div>
</div>
~~~

~~~css
.flex-container {
  /* display: flex; */
}

/* this selector selects all divs inside of .flex-container */
.flex-container div {
  background: peachpuff;
  border: 4px solid brown;
  height: 100px;
  /* flex: 1; */
}
~~~

The result should look something like this:

![initial](./imgs/01.png)

We'll get into exactly what's going on here soon enough, but for now, uncomment the two flex lines in your css and check out the result. Your 3 divs should now be arranged horizontally. If you resize your browser you'll also see that the divs will 'flex'. They will fill the available area, and will each have equal width.

![flexing](./imgs/02.png)

If you go and add another div to your HTML, inside of `.flex-container`, it will show up alongside the others, and everything will flex to make it fit.

#### Flex Containers and Flex Items
As you've seen, flexbox isn't just a single css property, but a whole toolbox of properties that you can use to put things where you need them. Some of these properties belong on the _flex container_ and some go on the _flex items_. This is a simple but important concept.

A flex container is any element that has `display: flex` on it. A flex item is any element that lives directly inside of a flex container.

![container-vs-child](./imgs/03.png)

Somewhat confusingly, any element can be both a flex container _and_ a flex item. Said another way, you can also put `display: flex` on a flex item, and then use flexbox to arrange _its_ children.

![nesting flex containers](./imgs/04.png)

This method of creating and nesting multiple flex containers and items is the primary way we will be building up complex layouts. The next image was achieved using _only_ flexbox to arrange, size, and place the various elements. It is a _very_ powerful tool.

![complex example](./imgs/05.png)

The resources to follow will take you through the basics. Be sure to follow along with any examples, that will help things to stick a little better when it comes time to practice your newfound skills.

#### Growing and Shrinking

The `flex` property is actually a shorthand for 3 properties that you can set on a flex-item. These properties affect how flex-items size themselves within their container. You've seen some shorthand properties before, but we haven't officially defined them yet.

> Shorthand properties are CSS properties that let you set the values of multiple other CSS properteis simultaneously. Using a shorthand property, you can write more concise (and often more readable) stylesheets, saving time and energy.
> Source: [Shorthand properties on MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Shorthand_properties)

In this case, `flex` is actually a shorthand for `flex-grow`, `flex-shrink` and `flex-basis`.

![flex shorthand](./imgs/10.png)

The default value of the `flex` property is shown in the above screenshot: `flex-grow: 0`, `flex-shrink: 1`, `flex-basis: 0%`. Very often you see the flex shorthand defined with only _one_ value. In that case, that value is applied to `flex-grow`, so when we put `flex: 1` on our divs, we were actually specifying `flex: 1 1 0%`.

`flex-grow` expects a single number as it's value, and that number is used as the flex-item's "growth factor". When we applied `flex: 1` to every div inside our container, we were telling every div to grow the same amount. The result of this is that every div ends up the exact same size. If you go back to our example from earlier and add `flex: 2` to just one of the divs, then that div would grow `2x` the size of the others.

Here's that example, with the `flex` shorthand spelled out completely.

~~~html
<div class="flex-container">
  <div class="one"></div>
  <div class="two"></div>
  <div class="three"></div>
</div>
~~~

~~~css
.flex-container {
  display: flex;
}

/* this selector selects all divs inside of .flex-container */
.flex-container div {
  background: peachpuff;
  border: 4px solid brown;
  height: 100px;
  flex: 1 1 0%;
}

/* only div.two is selected here */
.flex-container .two {
  flex: 2 1 0%;
}
~~~

`flex-shrink` is similar to `flex-grow`, but sets the "shrink factor" of a flex item. `flex-shrink` only ends up being applied if the size of all flex-items is larger than their parent container. For example, if our 3 divs from above had a width declaration like: `width: 100px`, and `.flex-container` was smaller than `300px`, our divs would have to shrink to fit.

The default shrink factor is `flex-shrink: 1`, which means all items will shrink evenly. If you do _not_ want an item to shrink then you can specify `flex-shrink: 0;`. You can also specify higher numbers to make certain items shrink at a higher rate than normal.

Here's an example. Note that we've also changed the `flex-basis` for reasons that will be explained shortly. If you shrink your browser window you'll notice that `.two` never gets smaller than the given width of 200px.

~~~html
<div class="flex-container">
  <div class="one"></div>
  <div class="two"></div>
  <div class="three"></div>
</div>
~~~

~~~css
.flex-container {
  display: flex;
}

/* this selector selects all divs inside of .flex-container */
.flex-container div {
  background: peachpuff;
  border: 4px solid brown;
  height: 100px;
  width: 200px;
  flex: 1 1 auto;
}

.flex-container .two {
  flex-shrink: 0;
}
~~~

`flex-basis` simply sets the initial size of a flex-item, so any sort of `flex-grow`ing or `flex-shrink`ing would start from that baseline size. The shorthand value is `flex-basis: 0%`. The reason we had to change it to `auto` in the `flex-shrink` example is that with the basis set to `0`, those items would ignore the item's width, and everything would shrink evenly.  Using `auto` as a flex-basis tells the item to check for a width declaration (`width: 200px`).

> #### important note about flex-basis
> there is a difference between the default value of `flex-basis` and the way the `flex` shorthand defines it if no `flex-basis` is given. The actual default value for `flex-basis` is `auto`, but when you specify `flex: 1` on an element, it interprets that as `flex: 1 1 0`. If you want to _only_ adjust an item's `flex-grow` you can simply do so directly, without the shorthand, or you can be more verbose and use the full 3 value shorthand `flex: 1 1 auto`


#### Axes
The most confusing thing about flexbox is that it can work either horizontally or vertically, and the way some rules work changes a bit depending on which direction you are working with.

The default direction for a flex container is horizontal, or `row` but you can change the direction to vertical or `column`. The direction can be specified in CSS like so:

~~~css
.flex-container {
  flex-direction: column;
}
~~~

No matter which direction you're using, you need to think of your flex-containers as having 2 axes, the main axis, and the cross axis. It is the direction of these axes that changes when the `flex-direction` is changed. In _most_ circumstances, `flex-direction: row` puts the main axis horizontal (left-to-right), and `column` puts the main axis vertical (top-to-bottom).

In other words, in our very first example, we put `display: flex` on a div and it arranged it's children horizontally. This is a demonstration of the default which is `flex-direction: row`. If you go back to that example and add `flex-direction: column` to the container, those divs will go vertical.... if you're following along however you'll notice a problem (give it a shot if you haven't already).

The problem here is that the divs shrink and lose their height, even tho the css clearly says `height: 100px`. The reason for this is that `flex: 1` tells those items to adjust themselves to fit inside the container, which doesn't have any height. There are multiple ways to fix this problem, such as adding a height to the container, or adding `flex-shrink: 0` to the items (as you might infer, this keeps them from shrinking).

We've strayed from the point sightly... We were talking about flex-direction and axes. To bring it back home, the default behavior is `flex-direction: row` which arranges things horizontally. The reason this often works well without changing other details in the css is because block-level elements default to the full width of their parent. Changing things to vertical using `flex-direction: column` adds complexity because block-level elements default to the height of their content, and in this case there _is_ no content.

There are situations where the behavior of flex-direction could change if you are using a language that is written top-to-bottom or right-to-left, but you should save worrying about that until you are ready to start making a website in Arabic or Hebrew. This distinction is explained with a little more detail in one of the reading assignments at the end of this lesson.

#### Aligning Across the Axes
So far everything we've touched with flexbox has used the rule `flex: 1` on all flex items, which makes the items grow or shrink equally to fill all of the available space. Very often, however, this is not the desired effect. Flex is also very useful for arranging items that have a specific size. Let's look at another example. Put the following code somewhere and follow along.

~~~html
<div class="container">
  <div class="item"></div>
  <div class="item"></div>
  <div class="item"></div>
</div>
~~~

~~~css
.container {
  padding: 16px;
  background: plum;
  border: 4px solid indigo;
  display: flex;
}

.item {
  width: 100px;
  height: 100px;
  border: 4px solid darkslategray;
  background: skyblue;
}
~~~

The result of the above code should look like this.

![flex-alignment-1](./imgs/06.png)

You should be able to predict what happens if you stick `flex: 1` on the `.item` by now. Give it a shot before we move on!

Adding `flex: 1` to `.item` will make each of the items grow to fill the available space, but what if we wanted them to stay the same width, but distribute themselves differently inside the container? We can do this!

Remove `flex: 1` from `.item` and add `justify-content: space-between` to `.container`. Doing so should give you this:

![space between](./imgs/07.png)

`justify-content` aligns items across the **main axis**. There are a few values that you can use here. You'll learn the rest of them in the reading assignments, but for now try changing it to `center`, which should center the boxes along the main-axis.

To change the placement of items along the **cross axis** use `align-items`. Try getting the boxes to the center of the container by adding `align-items: center` to `.container`. The desired result should look like this:

![centered](./imgs/08.png)

#### GAP
One more very useful feature of flex is the `gap` property. Setting `gap` on a flex container simply adds the specified space between flex items, very similar to adding a margin to the items themselves. `gap` is a _very_ new property so it doesn't show up in very many resources yet, but it works reliably in all modern browsers, so it is safe to use and is very handy! Adding `gap: 8px` to the centered example above produces this result.

![gap](./imgs/09.png)

There's more for you to learn in the reading below, but at this point surely you can see how immensely useful flexbox is. Using just the properties we've already covered you could already put together some impressive layouts!

Take your time going through the reading. There will be some review of the items we've already covered here, but it goes into more depth and touches on a few things that haven't been mentioned yet. Don't stress too much about trying to memorize every little detail yet, just code along with the examples and do your best to internalize everything that is _possible_ with flexbox. You'll have to reach for these resources again once you get to the practice exercises, but that's perfectly acceptable. The more you use this stuff the better it will stick in your mind... and you will be using it _constantly_. Have fun!

### Assignment
<div class="lesson-content__panel" markdown="1">
1. The [Basic concepts of flexbox](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Basic_Concepts_of_Flexbox) article on MDN is a good starting point. There are helpful examples and interactive sections.
2. [Aligning Items in a Flex Container](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Aligning_Items_in_a_Flex_Container) goes into more depth on the topic of axes and `align-items` vs `justify-content`.
3. [Typical use cases of Flexbox](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Typical_Use_Cases_of_Flexbox) is one more MDN article that covers some more practical tips. Don't skip the interactive sections! Playing around with this stuff is how you learn it!
4. The [CSS Tricks "Guide to Flexbox"](https://css-tricks.com/snippets/css/a-guide-to-flexbox/) is a classic. There isn't any new information for you here, but the images and examples are super helpful. This one is a great cheat sheet that you'll probably return to often. (Keep it handy for the practice exercises!)
</div>

### Practice

> When doing the following exercises, please use all the documentation and resources you need to accomplish them. You are _not_ intended to have any of this stuff memorized at this point. Check the docs, use google, do what you need to do (besides checking the solutions) to get them done.

Go back to our [CSS exercises repository](https://github.com/TheOdinProject/css-exercises) (you've done these previously, but don't forget the instructions are in the README). Do the exercises in the 'flex' directory in this order:

1. flex-center
2. flex-header
3. flex-header-2
4. flex-information
5. flex-modal
6. flex-layout
7. flex-layout-2

It may take you a while to get through all of them, and the difficulty ramps up as you progress. Stick with it! If you can get through all of them then you will be in _really_ good shape moving forward.


> When doing the following exercises, please use all the documentation and resources you need to accomplish them. You are _not_ intended to have any of this stuff memorized at this point. Check the docs, use google, do what you need to do (besides checking the solutions) to get them done.

Go back to our [CSS exercises repository](https://github.com/TheOdinProject/css-exercises) (you've done these previously, but don't forget the instructions are in the README). Do the exercises in the 'flex' directory in this order:

1. flex-center
2. flex-header
3. flex-header-2
4. flex-information
5. flex-modal
6. flex-layout
7. flex-layout-2

It may take you a while to get through all of them, and the difficulty ramps up as you progress. Stick with it! If you can get through all of them then you will be in _really_ good shape moving forward.

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something
* [What the Flexbox!?](https://flexbox.io/) is a great free video course from Wes Bos. If videos are your thing, this is a great resource for you. It's a good refresher if you're having a hard time getting this stuff to stick.
* [Flexbox froggy](https://flexboxfroggy.com/) is a funny little game for practicing moving things around with flexbox.
* This [Flexbox Tutorial](https://www.freecodecamp.org/news/css-flexbox-tutorial-with-cheatsheet/) from freecodecamp is another decent resource.

### Knowledge Check
* What's the difference between a flex container and a flex item?
* How do you create a flex item?
* how do you make flex items arrange themselves vertically instead of horizontally?
* What is the difference between `justify-content` and `align-items`?
* How do you use flexbox to completely center a div inside a flex container?
* What are the 3 values defined in the shorthand `flex` property? (e.g. `flex: 1 1 auto`)?
* What's the difference between `justify-content: space-between` and `justify-content: space-around`?
