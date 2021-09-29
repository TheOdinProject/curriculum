### Introduction

Custom properties (also known as CSS variables) can be a really useful and powerful tool when writing our CSS files. In short, they allows us to reference a CSS value however many times we want throughout a file. By using custom properties, instead of having to update every single instance of a specific value ("This shade of red is too light, let's change the shade on all seven of these selectors"), we only need to update a single instance: the custom property itself. Not only that, but custom properties can help us keep colors consistent throughout a project, something that will be really helpful as projects get larger.

We can even redefine custom properties under different contexts, which is incredibly useful for creating themes, such as the dark and light themes you see on many websites these days.

### Learning Outcomes

* You'll learn how to declare a custom property
* You'll learn how to access a custom property in a rule declaration

### Using Custom Properties

The syntax for declaring and accessing a custom property is really simple and not too different from how we write normal rule declarations:

~~~css
.error-modal {
  --color-error-text: red;

  color: var(--color-error-text);
}
~~~

That's it! First, we declare our custom property with a double hyphen followed by a case-sensitive, hyphen-separated property name (`color-error-text` wouldn't be the same as `Color-Error-Text`). The use of single hyphens to separate words is very important here because spaces are not valid (`--color error text` would not work). Then we can store any valid CSS value in our newly declared custom property. 

When we want to access a custom property, we use the `var()` function as the value of a CSS property, and then place our custom property inside of the parenthesis (including the double hyphen at the beginning).

While we can use custom properties for something as simple as a color value, we can also use them to store slightly more complex or even shorthand values:

~~~css
.error-modal {
  --modal-border: 1px solid black;
  --main-font: calc(2rem + 5vw);
}
~~~

### Scope

In the first example above, you may have noticed that we declared and then accessed our custom properties within the same declaration block. That's because the scope of a custom property is determined by the selector. 

In the example below, only the element with the `cool-paragraph` class would get styled with a red background, while the `boring-paragraph` selector doesn't since it's not within the scope of where the custom property was declared. If you're familiar with how scope works in JavaScript, this sort of behavior should feel a little similar.

~~~html
<p class='cool-paragraph'>Lorem ipsum dolor sit amet.</p>

<p class='boring-paragraph'>Lorem ipsum dolor sit amet.</p>
~~~
~~~css
.cool-paragraph {
  --main-bg: red;

  background-color: var(--main-bg);
}

.boring-paragraph {
  background-color: var(--main-bg);
}
~~~

That doesn't mean a custom property can *only* be accessed on the selector it was declared for, though. The scope includes the selector the custom property was declared for as well as the selector's descendants. Let's take a look at a modified version of the above example:

~~~html
<div class='cool-div'>
  <p class='cool-paragraph'>Lorem ipsum dolor sit amet.</p>
</div>
~~~
~~~css
.cool-div {
  --main-bg: red;
}

.cool-paragraph {
  background-color: var(--main-bg);
}
~~~

Even though we declared our custom property on our `.cool-div` selector, we can still access it on its descendant, the `.cool-paragraph` selector.

#### The `:root:` Selector

While there may be times where you will want to limit the scope of a custom property, you may want to be able to use other custom properties on many, unrelated selectors. One workaround would be declaring the same custom property on a bunch of selectors, but that defeats one of the purposes of using custom properties in the first place (the ease of changing multiple instances of a value at once).

A better solution is declaring those custom properties on the `:root` selector, which is essentially the same thing as the `html` selector except it has a higher specificity.

~~~html
<p class='cool-paragraph'>Lorem ipsum dolor sit amet.</p>

<p class='exciting-paragraph'>Lorem ipsum dolor sit amet.</p>
~~~
~~~css
:root {
  --main-color: red;
}

.cool-paragraph {
  color: var(--main-color);
}

.exciting-paragraph {
  background-color: var(--main-color);
}
~~~

By declaring our custom property on the `:root` selector in the example above, we can access it on *any* other valid selector within our CSS file, since any other selector would be considered a descendant of the `:root` selector.

### Creating Themes with Custom Properties

Beyond allowing us to access custom properties more globally, the `:root` selector gives us one way to add themes to our pages:

<p class="codepen" data-height="300" data-default-tab="html,result" data-slug-hash="PojVRMb" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/PojVRMb">
  theme toggle example</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

First we added a `class` attribute on our `html` element so that our page has a default theme. Next in our CSS we created two scopes for our custom properties on the `:root` selector, one for when our `html` (or root) element has a class of `dark` and another for when it has a class of `light`. Our other selectors then use the values of any custom properties depending on which class is currently present on our root element.

#### Media Queries

Giving users the ability to toggle a theme themselves is great, but there's another option for setting a theme that you may have come across on certain sites or applications: using the user's theme setting from their operating system or user agent (like a browser). This can be accomplished with the `prefers-color-scheme` media query, which simply checks whether a user has selected a theme preference on their OS/user agent. As you view the example below, try changing the theme settings on your OS/user agent to see how the example updates in real time!

<p class="codepen" data-height="300" data-default-tab="html,result" data-slug-hash="powGZzE" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/powGZzE">
  theme query example</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

We first added custom properties on the `:root` element outside of the media query. This gives us a default theme in case a user doesn't have a preference set on their OS or user agent, or if a browser doesn't support the media query. In this case, we're using our "light" theme colors as the default. Then we added a `prefers-color-scheme` media query for when a user has a dark theme set in their preferences.

Using the `prefers-color-scheme` media query can be pretty helpful for users since it doesn't require them to manually change the theme to their preferred one. That said, you need to be aware of a few things when it comes to using this media query:

1. Only `dark` and `light` are valid values for the media query, so you can't use it to implement any themes beyond these two basic ones.
2. The `light` value for the media query is actually for when a user has a light theme specified *or* when they have no preference set.
2. It doesn't allow users to change the theme themselves, which can still be important in cases where a user might want to use the theme opposite of their OS/user agent preferred one for whatever reason.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Read through MDN's [Using CSS custom properties](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties) page starting at the "Inheritance of custom properties" section.
2. Open the inspector on this page to inspect the styles and see how Odin uses some custom properties.
</div>

### Additional Resources

This section contains helpful links to other content. It isn’t required, so consider it supplemental for if you need to dive deeper into something.

### Knowledge Check

* How would you declare a custom property with a name of `text-color`?
* How would you access a custom property with a name of `background-color`?
* Where would you declare a custom property to have its scope be global and accessible by all other selectors?
* Where would you declare a custom property so that a user's theme setting from their OS or browser was taken into account?
