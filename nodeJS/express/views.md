### Introduction

We’ll need a way of rendering the data from our controller functions, and views let us do that. In the context of the MVC architecture, views are the user-facing part of the application. They are the UI that the user interacts with. Views are sections of code that generate the HTML for our applications. They define the layout for the rendered HTML and allow data to be rendered where dictated in our layout.

We use template engines to create our views. More specifically, template engines are used to create template files that transform the template into HTML. Any variables defined in our template files are replaced with actual data.

In this course, we will use [EJS](link: https://ejs.co/) which lets us write in JavaScript to create HTML markup.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- EJS Installation
- EJS Syntax
- Application of EJS

### Setting up EJS

Let's get started with EJS! Install EJS into your application by typing the following into your terminal:

```bash
npm install ejs
```

At the root of your project, create a subfolder called `views`.

Next, we need to let our app know that we intend to use `EJS` as a template engine, as well as where to look for view files.

In your `app.js` file, add the following:

```js
app.set("views", path, join(__dirname, "views"));
app.set("view engine", "ejs");
```

This enables `EJS` as the view engine, and that our app should look for templates in the `/views` subdirectory.

### Template syntax

In `EJS`, the `<%` and `%>` tags allow us to use JavaScript. Whatever is in these tags will behave like JavaScript. This lets us write conditional statements, `for` loops, and use variables.

In order to work with variables, we use the `<%=` tag. This lets us convert variables into values when the application is loaded. Otherwise, stick with `<%` when using JavaScript logic.

Here's a quick example that makes includes arrays and loop logic.

```js
<% const animals = ["Cat", "Dog", "Lemur", "Hawk"];%>

<% animals.map(animal => {%>
- <%= animal%>s are cute <% }) %>
```

### Using EJS with Express

Let's use `EJS` with `Express`. First, create an `EJS` template file called `index.ejs`, and add the following:

```html
<html>
  <body>
    <%= message %>
  </body>
</html>
```

And in app.js, render this template file in one of your routes:

```js
app.get("/", (req, res) => {
  res.render("index", { message: "EJS rocks!" });
});
```

When the `"/"` route is matched, the template file matching `"index"` is rendered with the message value passed, such that you should see:

```
EJS rocks!
```

### Reusable web components

You may want to include webpage components that are shared across different pages, such as a sidebar or a header. To insert such components into your pages, we make use of the `includes` command. This requires the name of the file to be inserted.
Say you have the following navbar component called `"navbar.ejs"`:

```html
<!-- navbar.ejs -->
<nav>
  <ul>
    <% for (const i = 0; i < links.length; i++) { %>
    <li>
      <a href="<%= links[i].href %>">
        <span> <%= links[i].text %> </span>
      </a>
    </li>
    <% } %>
  </ul>
</nav>
```

You can insert this component into another EJS file like so:

```html
<!-- main.ejs -->
<html>
  <head>
    <title>Homepage</title>
    <body>
      <% include navbar.ejs %>

      <!-- You can insert the link variable here, as JS variables will be processed before rendering -->
      <script>
        const links = [
          {
            href: "/",
            text: "Home",
          },
          {
            href: "about",
            text: "About",
          },
        ];
      </script>
    </body>
  </head>
</html>
```

This is handy as the alternative would be copy and pasting the navbar onto every page that requires it.

This can be used to include headers and footers in all of your pages, for example.

Here's another example of how to use `includes` to dynamically render a list of variables:

```html
<ul>
  <% users.map( user => { %> <%- include('user/show', {user: user}) %> <% }) %>
</ul>
```

Note the use of of the raw output tag `<%-` with the `include` which is used to avoid double-escaping the HTML output.

#### Note box variations

<div class="lesson-note" markdown="1">

#### A sample title

A sample note box.

</div>

<div class="lesson-note lesson-note--tip" markdown="1">

#### level 4 heading for title is recommended

A sample note box, variation: tip.

</div>

<div class="lesson-note lesson-note--warning" markdown="1">

#### But title is also optional

A sample note box, variation: warning.

</div>

<div class="lesson-note lesson-note--critical" markdown="1">

A sample note box, variation: critical.

</div>

### Assignment

<div class="lesson-content__panel" markdown="1">

1. A RESOURCE ITEM
   - AN INSTRUCTION ITEM
1. A PRACTICE ITEM
   - A TASK ITEM

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [A KNOWLEDGE CHECK QUESTION](A-KNOWLEDGE-CHECK-URL)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
