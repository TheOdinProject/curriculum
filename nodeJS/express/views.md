### Introduction

We’ll need a way of rendering the data from our controller functions, and views let us do that. In the context of the MVC architecture, views are the user-facing part of the application. Views are sections of code that generate the HTML for our applications. They define the layout for the rendered HTML and allow data to be rendered where dictated in our layout. In order to display the resulting HTML to the user, views will need to be rendered, typically at the end of controller functions of `GET` requests.

We use template engines to create our views. More specifically, template engines are used to create template files that transform the template into HTML. Any variables defined in our template files are replaced with actual data. Additionally we can insert logic into our template file, eg. render the user's username once they have logged in. This would not be possible with plain HTML.

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

### EJS syntax

In `EJS`, the `<%` and `%>` tags allow us to use JavaScript. Whatever is in these tags will behave like JavaScript. This lets us write conditional statements, `for` loops, as well as use variables.

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

You may want to include webpage components that are shared across different pages, such as a sidebar or a header. To insert such components into your pages, we make use of the `include` command. This requires the name of the file to be inserted, and optionally an object of data you wish to pass.

Say you have the following navbar component called `"navbar.ejs"`:

```html
<!-- navbar.ejs -->
<nav>
  <ul>
    <% for (let i = 0; i < links.length; i++) { %>
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
<!-- index.ejs -->
<html>
  <head>
    <title>Homepage</title>
    <body>
      <%- include('navbar', {links: links}) %>
    </body>
  </head>
</html>
```

This can be used to include headers and footers in all of your pages, for example.

Note that the navbar expects a `links` value. To pass this data into the navbar, you can pass it when rendering `index.ejs` which contains the navbar. Modify `app.js` such that a `links` object is defined and passed into the `render` function in the `"/"` route handler:

```js
// app.js
const links = [
  { href: "/", text: "Home" },
  { href: "about", text: "About" },
];

app.get("/", (req, res) => {
  res.render("index", { links: links });
});
```

Here's another example of how to use `includes` to dynamically render a list of variables:

```html
<ul>
  <% users.map( user => { %> <%- include('user/show', {user: user}) %> <% }) %>
</ul>
```

Note the use of the raw output tag `<%-` with the `include` which is used to avoid double-escaping the HTML output.

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
- [How do you configure EJS for Express projects?](#setting-up-ejs)
- [What is the difference between "<%" and "<%=" tags?](#ejs-syntax)
- [How do you render a view in a controller callback?](#using-ejs-with-express)
- [How can components be included in other components?](#reusuable-web-components)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
