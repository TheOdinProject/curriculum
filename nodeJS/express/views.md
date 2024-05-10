### Introduction

Views are the user-facing part of the application, in this case, HTML files. We've dealt with views in an earlier project where the server would send HTML files to the user. These files are static, but many of our use cases require views to be dynamic w.r.t. data.

Hence, we use template engines to create our views. As the name suggests, we write template files in our codebase that get transformed into HTML when we respond to a server request. Any variables defined in our template files are replaced with actual data. Additionally, we can insert conditional and/or loop logic into our template file, e.g. render the user's username once they have logged in. This would not be possible with plain HTML.

In this course, we will use [EJS](https://ejs.co/). EJS's syntax is very similar to that of HTML, meaning that the learning curve is relatively low compared to other template engines.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- How to setup EJS in an Express project
- How to use EJS

### Setting up EJS

Let's get started with EJS! Install EJS into your application by typing the following into your terminal:

```bash
npm install ejs
```

At the root of your project, create a subfolder called `views`.

Next, we need to let our app know that we intend to use `EJS` as a template engine, as well as where to look for view files.

In your `app.js` file, set the following application properties:

```javascript
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");
```

This enables EJS as the view engine, and that our app should look for templates in the `/views` subdirectory.

### EJS syntax

In EJS, the `<%` and `%>` tags allow us to use JavaScript. This lets us write conditional statements, `for` loops, as well as use variables.

In order to output a variable as a value, we use the `<%=` tag.

Here's a quick example that includes arrays and loop logic.

```ejs
<% const animals = ["Cat", "Dog", "Lemur", "Hawk"] %>

<ul>
  <% animals.map((animal) => { %>
    <li><%= animal %>s are cute</li>
  <% }) %>
</ul>
```

### Using EJS with Express

Let's use EJS with Express. First, create an EJS template file called `index.ejs` in the `views` subdirectory, and add the following:

```ejs
<html>
  <body>
    <%= message %>
  </body>
</html>
```

And in app.js, render this template file in one of your routes:

```javascript
app.get("/", (req, res) => {
  res.render("index", { message: "EJS rocks!" });
});
```

Start the server and go to the `/` route in the browser. You should see:

```html
EJS rocks!
```

If you inspect the HTML in the browser's dev tools, you can see HTML is structures exactly like how we wrote the EJS template with the `message` variable replaced with its value.

When you hit the `/` route, `res.render("index", { message: "EJS rocks!" });` is the line that sends back the response. Since we've already defined the `views` and `view engine` app properties, the first argument of `res.render` is programmed to look for "a template called index in the specified folder", while the second argument is an object of variables that are to be made available to that specific template.

### Reusable templates

You may want to include webpage components that are shared across different pages, such as a sidebar or a header. To insert such components into your pages, we make use of the `include` command. This requires the name of the file to be inserted, and optionally an object of data you wish to pass.

Say you have the following navbar component called `"navbar.ejs"`:

```ejs
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

```ejs
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

```javascript
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

```ejs
<ul>
  <% users.forEach((user) => { %>
    <%- include('user/show', {user: user}); %>
  <% }); %>
</ul>
```

<div class="lesson-note lesson-note--tip" markdown="1">

#### Directories within the views folder

We can have nested directories of EJS template files within the views. For example, to render the template file `./views/user/show.ejs`, we'll need to provide the relative path like so:

```javascript
// in res.render
res.render("user/show");

// in include
include("user/show");
```

Note the use of the raw output tag `<%-` with the `include` which is used to avoid double-escaping the HTML output.

</div>

### Serving Static Assets

Serving static assets with EJS is similar to how we served assets previously when working directly with HTML, in that we can add external files to the head of the template file using the `link` tag. The main thing to point out is that the app needs to know where to serve assets from. Assuming `express` is installed, set the following lines in `app.js`:

```javascript
app.use(express.static(path.join(__dirname, "public")));
```

`express.static()` is a middleware function that enables the use of static assets, and we tell it to look for assets with the `public` directory as the root.

Say we have the following `styles.css` file in the root of the `public` directory:

```css
body {
  color: red;
}
```

To serve `styles.css` in `index.ejs`, set the following `link` tag like so in the head:

```ejs
<head>
  <link rel="stylesheet" href="./styles.css">
</head>
```

Your `index.ejs` file should now display red text!

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Have another read through the [EJS docs](https://ejs.co/#docs).
1. Read through the [Express resource on template engines](https://expressjs.com/en/guide/using-template-engines.html). The resource uses Pug for the examples which has a different syntax, however the information should still be a useful supplement to this lesson.
1. Let's add to the app we've been developing this lesson! Add a view for an about page, which should render on the `/about` route.
1. Create a reusable footer template and render it in all of the app routes.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [How do you configure EJS for Express projects?](#setting-up-ejs)
- [What is the difference between "<%" and "<%=" tags?](#ejs-syntax)
- [How do you render a view in a controller callback?](#using-ejs-with-express)
- [How can templates be included in other templates?](#reusable-templates)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [How to Use EJS to Template Your Node.js Application](https://blog.logrocket.com/how-to-use-ejs-template-node-js-application/)
