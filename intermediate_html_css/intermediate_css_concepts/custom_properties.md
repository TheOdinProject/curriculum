### Introduction

Custom properties (also known as CSS variables) can be a really useful and powerful tool when writing our CSS files. In short, they allow us to reference a CSS value however many times we want throughout a file. By using custom properties, instead of having to update every single instance of a specific value ("This shade of red is too light, let's change the shade on all seven of these selectors"), we only need to update a single instance: the custom property itself. Not only that, but custom properties can help us keep colors consistent throughout a project, something that will be really helpful as projects get larger.

We can even redefine custom properties under different contexts, which is incredibly useful for creating themes, such as the dark and light themes you see on many websites these days.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- How to declare custom properties.
- How to use a custom property in a rule declaration.
- The scope of custom properties.
- The root selector.
- Using media queries.

### Using custom properties

The syntax for declaring and accessing a custom property is not too different from how we write normal rule declarations:

```css
.error-modal {
  --color-error-text: red;
  --modal-border: 1px solid black;
  --modal-font-size: calc(2rem + 5vw);

  color: var(--color-error-text);
  border: var(--modal-border);
  font-size: var(--modal-font-size);
}
```

That's it! First, we declare our custom property with a double hyphen followed by a case-sensitive, hyphen-separated property name (`color-error-text` wouldn't be the same as `Color-Error-Text`). The use of Kebab case (single hyphens to separate words) is very important here because spaces are not valid (`--color error text` would not work). Then we can store any valid CSS value in our newly declared custom property, whether it be a color value, shorthand values, or even a more complex function, just to give you a few examples.

When we want to access a custom property, we use the `var()` function as the value of a CSS property, and then place our custom property inside of the parenthesis (including the double hyphen at the beginning).

#### Fallback values

The `var()` function actually accepts two parameters. The first parameter we've already gone over, which is the custom property we want to assign. The second parameter is an optional fallback value. When a fallback value is provided in addition to a custom property, the fallback value will be used if the custom property is invalid or hasn't been declared yet. We can even pass in *another* custom property as a fallback, which can have *its own* fallback value as well!

```css
.fallback {
  --color-text: white;

  background-color: var(--undeclared-property, black);
  color: var(--undeclared-again, var(--color-text, yellow));
}
```

In the above example, our `background-color` property would have a value of `black` and our `color` property would have a value of `white`. If the `--color-text` custom property was invalid or didn't exist, the fallback to our fallback would take over and the `color` property would have a value of `yellow`.

### Scope

In the first example above, you may have noticed that we declared and then accessed our custom properties within the same declaration block. That's because the scope of a custom property is determined by the selector. This scope includes the selector the custom property was declared for as well as any descendants of that selector. If you're familiar with how scope works in JavaScript, this sort of behavior should feel a little similar.

In the example below, only the element with the `cool-paragraph` class would get styled with a red background since it's a descendant of the element where our custom property is declared.

```html
<div class='cool-div'>
  <p class='cool-paragraph'>Check out my cool, red background!</p>
</div>

<p class='boring-paragraph'>I'm not in scope so I'm not cool.</p>
```

```css
.cool-div {
  --main-bg: red;
}

.cool-paragraph {
  background-color: var(--main-bg);
}

.boring-paragraph {
  background-color: var(--main-bg);
}
```

#### The :root selector

While there may be times where you will want to limit the scope of a custom property, you may want to be able to use other custom properties on many, unrelated selectors. One workaround would be declaring the same custom property on a bunch of selectors, but that defeats one of the purposes of using custom properties in the first place (the ease of changing multiple instances of a value at once).

A better solution is declaring those custom properties on the `:root` selector, which is essentially the same thing as the `html` selector except it has a higher specificity.

```html
<p class='cool-paragraph'>Lorem ipsum dolor sit amet.</p>

<p class='exciting-paragraph'>Lorem ipsum dolor sit amet.</p>
```

```css
:root {
  --main-color: red;
}

.cool-paragraph {
  color: var(--main-color);
}

.exciting-paragraph {
  background-color: var(--main-color);
}
```

By declaring our custom property on the `:root` selector in the example above, we can access it on *any* other valid selector within our CSS file, since any other selector would be considered a descendant of the `:root` selector.

### Creating themes with custom properties

Beyond allowing us to access custom properties more globally, the `:root` selector gives us one way to add themes to our pages:

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="PojVRMb" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/PojVRMb">
  Theme Toggle | CSS Custom Properties</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

First, since we don’t have direct access to the root element in the HTML tab on codepen, we’ve applied a default class of `dark` using the settings menu. Feel free to open the pen and change this setting to see how it behaves! Next in our CSS we created two scopes for our custom properties on the `:root` selector, one for when our `html` (or root) element has a class of `dark` and another for when it has a class of `light`. Our other selectors then use the values of any custom properties depending on which class is currently present on our root element.

#### Media queries

Giving users the ability to toggle a theme themselves is great, but there's another option for setting a theme that you may have come across on certain sites or applications: using the user's theme setting from their operating system or user agent (like a browser). This can be accomplished with the `prefers-color-scheme` media query, which checks whether a user has selected a theme preference on their OS/user agent. As you view the example below, try changing the theme settings on your OS/user agent to see how the example updates in real time!

<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="css,result" data-slug-hash="powGZzE" data-editable="true" data-user="TheOdinProjectExamples" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/TheOdinProjectExamples/pen/powGZzE">
  Theme Query | CSS Custom Properties</a> by TheOdinProject (<a href="https://codepen.io/TheOdinProjectExamples">@TheOdinProjectExamples</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

We first added custom properties on the `:root` element outside of the media query. This gives us a default theme in case a user doesn't have a preference set on their OS or user agent, or if a browser doesn't support the media query. In this case, we're using our "light" theme colors as the default. Then we added a `prefers-color-scheme` media query for when a user has a dark theme set in their preferences.

Using the `prefers-color-scheme` media query can be pretty helpful for users since it doesn't require them to manually change the theme to their preferred one. That said, you need to be aware of a few things when it comes to using this media query:

1. Only `dark` and `light` are valid values for the media query, so you can't use it to implement any themes beyond these two basic ones.
1. The `light` value for the media query is actually for when a user has a light theme specified *or* when they have no preference set.
1. It doesn't allow users to change the theme themselves, which can still be important in cases where a user might want to use the theme opposite of their OS/user agent preferred one for whatever reason.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. This [video on CSS custom properties](https://www.youtube.com/watch?v=PHO6TBq_auI) is a great introduction. Go ahead and watch it.
1. Read through MDN's [Using CSS custom properties](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties#inheritance_of_custom_properties) page starting at the "Inheritance of custom properties" section.
1. Read the CSS Tricks article for a [comprehensive overview of custom properties and what you can do with them](https://css-tricks.com/a-complete-guide-to-custom-properties/).
1. Open the inspector on this page to inspect the styles and see how Odin uses some custom properties.
</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- [How would you declare a custom property with a name of `text-color`?](#using-custom-properties)
- [How would you access a custom property with a name of `background-color`?](#using-custom-properties)
- [Where would you declare a custom property to have its scope be global and accessible by all other selectors?](#scope)
- [Where would you declare a custom property so that a user's theme setting from their OS or browser was taken into account?](#creating-themes-with-custom-properties)

### Additional resources

This section contains helpful links to other content. It isn't required, so consider it supplemental for if you need to dive deeper into something.

- [Using CSS custom properties](https://www.youtube.com/watch?v=_2LwjfYc1x8) by Kevin Powell is a great video showing neat ways to use custom properties.
