### Introduction

Custom properties (also known as CSS variables) can be a really useful and powerful tool when writing our CSS files. In short, they allows us to reference a CSS value however many times we want throughout a file. How is this any different or better than just using the value, you ask?

By using custom properties, instead of having to update every single instance of a specific value ("This shade of red is too light, let's change the shade on all seven of these selectors"), we only need to update a single instance: the custom property itself.

Not only that, but we can even use the same custom property in different selectors, giving each instance of the property a different value. This is incredibly useful for creating themes, such as the dark and light themes you see on many websites these days.

### Learning Outcomes

* You'll learn how to declare a custom property
* You'll learn how to access a custom property in a rule declaration

### Using Custom Properties

The syntax for declaring a custom property is really simple, and it's actually pretty similar to how we make a normal rule declaration:

~~~css
.error-modal {
  --color-error-text: red;
}
~~~

That's it! First, we start with a double hyphen followed by a case-sensitive, hyphen-separated property name (`color-error-text` wouldn't be the same as `Color-Error-Text`). The use of single hyphens to separate words is very important here because spaces are not valid (`--color error text` would not work).

Then we can store any valid CSS value in our newly declared custom property. Yes, *any valid CSS value*. So while we can use custom properties for something as simple as a color, we can also use them to store slightly more complex or even shorthand values:

~~~css
.error-modal {
  --modal-border: 1px solid black;
  --main-font: calc(2rem + 5vw);
}
~~~

So now we know how to declare a custom property, but how do we actually *access* it in a rule declaration? As simply as declaring it, of course:

~~~css
.error-modal {
  /* declaring the custom properties */
  --color-error-text: red;
  --main-font: 1.25rem;
  --modal-border: 1px solid black;

  /* accessing those custom properties */
  border: var(--modal-border);
  color: var(--color-error-text);
  font-size: var(--main-font);
}
~~~

We use the `var()` function as the value of a CSS property, and then place our custom property inside of the parenthesis (including the double hyphen at the beginning).

### Scope

In the last example above, you may have noticed that we declared and then accessed our custom properties within the same declaration block. That's because the scope of a custom property is determined by the selector.

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

In the above example, only the element with the `cool-paragraph` class gets styled with a red background, while the `boring-paragraph` selector doesn't since it's not within the scope of where the custom property was declared. If you're familiar with how scope works in JavaScript, this sort of behavior should feel a little similar.

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

Even though we declared our custom property on our `.cool-div` selector, we can still access it on its descendant `.cool-paragraph` selector. Thanks, dad! Er, thanks `cool-div`!

#### The `:root:` Selector

While there may be times where you will want to limit the scope of a custom property, you may want to be able to use other custom properties on many, unrelated selectors. One work around would be declaring the same custom property on a bunch of selectors, but that defeats one of the purposes of using custom properties in the first place (the ease of changing multiple instances of a value at once).

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

### Themes

Beyond allowing us to access custom properties more globally, the `:root` selector gives us one way to add themes to our pages. Keep in mind that we're not covering every way to add theming in this lesson, as we just want to introduce you to a simple way that you can get a lot of use out of.

~~~html
<html class='dark'>
<!-- our boilerplate... -->
  <body>
    <div class='themed-element'>Our themed text</div>
  </body>
</html>
~~~
~~~css
:root.dark {
  --color-background: rgb(18, 18, 18);
  --color-text: rgb(255, 255, 255);
}

:root.light {
  --color-background: rgb(255, 255, 255);
  --color-text: rgb(18, 18, 18);
}

.themed-element {
  background-color: var(--color-background);
  color: var(--color-text);
}
~~~

We just created some quick themes! So what is actually going on here? First, we added a `class` attribute on our `html` element in the HTML file so that we can have a more specific selector to add custom properties onto, and so that our page has a default theme.

In our CSS file we're just creating two scopes for our custom properties on the `:root` selector, one for when our `html` (or root) element has a class of `dark`, and another for when it has a class of `light`. Then our `.themed-element` selector will use the values of the custom properties depending on which class is currently present on our root element.

Besides just adding custom properties to the CSS file, we need to add in some JavaScript to handle changing the theme, as well as some interactive element for the user to actually change it (such as a toggle or a switch). At this point, we trust that you can easily find out how to do both of these since that's a little out of scope for this lesson.

#### Media Queries

Giving users the ability to toggle a theme themselves is great, but there's another option for setting a theme that you may have noticed on certain sites or applications: using the user's theme setting from their operating system or user agent (like a browser).

Instead of adding custom properties to the `:root` element depending on which class it has, we would add our custom properties on the `:root` element, without any class, inside of a `prefers-color-scheme` media query. Let's tweak our previous example a little bit to use this media query:

~~~css
@media (prefers-color-scheme: dark) {
  :root {
    --color-background: rgb(18, 18, 18);
    --color-text: rgb(255, 255, 255);
  }
}

@media (prefers-color-scheme: light) {
  :root {
    --color-background: rgb(255, 255, 255);
    --color-text: rgb(18, 18, 18);
  }
}

.themed-element {
  background-color: var(--color-background);
  color: var(--color-text);
}
~~~

This can be pretty helpful for users since it doesn't require them to change the theme to their preferred one. That said, you should be aware of some shortcomings of using this media query:

1. Only `dark` and `light` are valid values for the media query, so you can't use it to implement any themes beyond these two basic ones.
2. It doesn't allow users to change the theme themselves, which can still be important in cases where the user hasn't chosen a theme setting on their OS or user agent, or in case they actually prefer a different theme on your site for whatever reason.

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