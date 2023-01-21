### Introduction

Up until this point in the curriculum, we have been building one-page applications. However, for any larger scale application, we are going to have multiple pages. Thankfully, the browser allows client-side javascript to manage the way an user can navigate, with the [History API](https://developer.mozilla.org/en-US/docs/Web/API/History_API/Working_with_the_History_API). We can leverage the power of this to manage routing in React with the help of a package like `react-router-dom`.

### Lesson Overview

This section contains a general overview of topics that you will learn in this lesson.

- What is client-side routing?
- How do you use React Router to do lient-side routing?
- How do you create nested and dynamic paths?
- How do you add a "catch-all" route?
- How do you add protected routes?

### Client-Side Routing

Client-side routing is the type of routing where the javascript takes over the duty of handling the routes in an application. Client-side routing helps in building single-page applications (SPAs) without refreshing as the user navigates. For example, when a user clicks a navbar element, the URL changes and the view of the page is modified accordingly, within the client.

Say you are cooking some chicken. If you want to cook it well and nice, you will have to:

1. Put the chicken in the microwave and set it to cook with appropriate time and heating
2. Wait till the microwave gives out that satisfying **ding**
3. Start munching!

This is common to all websites, you set the microwave up for what you want (visit any URL, like https://theodinproject.com/), wait for the microwave to be done with the cooking (the loading screen), and tada, enjoy your delicious food (your page is ready for use). But what if you forgot to add some spices before you cooked it up? You have to repeat this flow again:

1. Add the spices to the chicken
2. Put it back into the microwave and set it up to be reheated
3. Wait for it to be nice and warm
4. Now you can eat it!

Here is where we reiterate, **the chicken needs to be reheated**. In a general multi-page application (MPAs), the browser reloads every time you click on a link to navigate. With client-side routing, **you never leave the page you are on** - you bring the microwave to the table to ensure that you don't run into the "missing spices" issues. The data is rendered with javascript, instead of letting the browser handle it.

### A Reactive Solution

While this allows for nicer, app-like interactions (since you are controlling the routes, you can make fancy css animations across route changes), a lot of caveats can be missed. Browsers reloads notify screen-readers of new content to read, so you will need to notify screen-readers of route updates manually. However, with the help of a robust library, you can often address these concerns!

React Router is a standard routing library for React applications. By using react-router, we can specify react components, that can be rendered based on the route.

### Adding A Router

Let's make a small app to understand how this router is implemented. Create a new project using `create-react-app` and get rid of the boilerplate code as you already learned in previous lessons (just leave the `index.js` and the `App.js` files). Let's add some mock pages as an example. Create a new `Profile.js` file with the following component:

```jsx
const Profile = () => {
  return (
    <div>
      <h1>Hello from profile page!</h1>
      <p>So, how are you?</p>
    </div>
  );
};

export default Profile;
```

Replace the `App.js` file with some basic content too:

```jsx
const App = () => {
  return (
    <div>
      <h1>Hello from the main page of the app!</h1>
      <p>Here are some examples of links to other pages</p>
      <nav>
        <ul>
          <li>
            <a href="profile">Profile page</a>
          </li>
        </ul>
      </nav>
    </div>
  );
};

export default App;
```

Now it's time to add the router! In **React Router v6.7.0**, it is recommended to add routes in form of an object. Add the following to `root.js`, we will talk about what is happening, in a little bit.

```jsx
import React from "react";
import ReactDOM from "react-dom/client";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import App from "./App";
import Profile from "./Profile";

const router = createBrowserRouter([
  {
    path: "/",
    element: <App />,
  },
  {
    path: "/profile",
    element: <Profile />,
  },
]);

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
```

Once this is done, go ahead and run `npm start` and check out both routes: the home route "/" and the profile route "/profile" It works! But what is happening here?

1. We import `createBrowserRouter` and `RouterProvider` from "react-router-dom".
2. `createBrowserRouter` is used to create the configuration for a router by simply passing arguments in the form of an array of routes.
3. This generated configuration is then rendered in, by passing it to the `RouterProvider` component.
4. The configuration array contains objects with two mandatory keys, the path and the corresponding element to be rendered.

### The Link Element

But you may notice, when we click the links in the navbar, the browser is reloading for the next URL instead of using React Router. This isn't what was promised! To help with this, React Router exports a custom `Link` element to be used instead of the regular `a` tag. We can replace the `a` tag in our navbar with the `Link` element.

```jsx
import { Link } from "react-router-dom";

const App = () => {
  return (
    <div>
      <h1>Hello from the main page of the app!</h1>
      <p>Here are some examples of links to other pages</p>
      <nav>
        <ul>
          <li>
            <Link to="profile">Profile page</Link>
          </li>
        </ul>
      </nav>
    </div>
  );
};

export default App;
```

And now, we don't get the browser reloading everytime we click the link on the navbar!

### Nested Routes, Outlets And Dynamic Segments

Now, what if you want to render a section of a page, differently, based on different URLs? This is where nested routes into play! We can add routes nested as the children of one another to ensure that the child gets rendered alongside the parent. Create a couple of components, `Popeye.js` and `Spinach.js`.

```jsx
import { Link } from "react-router-dom";

const Popeye = () => {
  return (
    <p>
      Hi, I am Popeye! I love to eat Spinach!{" "}
      <Link to="/">Click here to go back</Link>
    </p>
  );
};

export default Popeye;
```

```jsx
import { Link } from "react-router-dom";

const Spinach = () => {
  return (
    <p>
      Hi, I am Spinach! Popeye loves to eat me!{" "}
      <Link to="/">Click here to go back</Link>
    </p>
  );
};

export default Spinach;
```

Now, we can rewrite the routes as given:

```jsx
import React from "react";
import ReactDOM from "react-dom/client";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import App from "./App";
import Profile from "./Profile";
import Spinach from "./Spinach";
import Popeye from "./Popeye";

const router = createBrowserRouter([
  {
    path: "/",
    element: <App />,
  },
  {
    path: "profile",
    element: <Profile />,
    children: [
      { path: "spinach", element: <Spinach /> },
      { path: "popeye", element: <Popeye /> },
    ],
  },
]);

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
```

This allows us to render the child component alongside the parent, through an `Outlet`! We can rewrite the Profile component to add an `Outlet` which will get replaced by the various profiles when that route is visited!

```jsx
import { Outlet } from "react-router-dom";

const Profile = () => {
  return (
    <div>
      <h1>Hello from profile page!</h1>
      <p>So, how are you?</p>
      <hr />
      <h2>The profile visited is here:</h2>
      <Outlet />
    </div>
  );
};

export default Profile;
```

Check out the "/profile", "/profile/popeye" and "/profile/spinach" pages. They render children paths render at the position of the outlet now.

If you want to render somthing as a default component when no path is added to profile, you can add an index route to the children! Create a default profile component.

```jsx
const DefaultProfile = () => {
  return <p>Oh, nothing to see here!</p>;
};

export default DefaultProfile;
```

Now, add an index tag with the DefaultProfile as a child to the "/profile" route.

```jsx
import React from "react";
import ReactDOM from "react-dom/client";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import App from "./App";
import Profile from "./Profile";
import DefaultProfile from "./DefaultProfile";
import Spinach from "./Spinach";
import Popeye from "./Popeye";

const router = createBrowserRouter([
  {
    path: "/",
    element: <App />,
  },
  {
    path: "profile",
    element: <Profile />,
    children: [
      { index: true, element: <DefaultProfile /> },
      { path: "spinach", element: <Spinach /> },
      { path: "popeye", element: <Popeye /> },
    ],
  },
]);

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
```

If you visit the "/profile" path now, you should be able to see some default content where the `Outlet` is rendered when the index path is rendered!

But this example brings another dillemma. Sometimes, we want to read what was provided to the path and render content accordingly. That, here, would mean that we will should be able to render content dynamically, from the component itself. Thankfully, you can do so with dynamic segments! Change the routes to be the following:

```jsx
import React from "react";
import ReactDOM from "react-dom/client";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import App from "./App";
import Profile from "./Profile";

const router = createBrowserRouter([
  {
    path: "/",
    element: <App />,
  },
  {
    path: "profile/:name",
    element: <Profile />,
  },
]);

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
```

The colon (:) has special meaning, turning the path section after it, into a <span id="dynamic-segments">"dynamic segment"</span>. Dynamic segments will match dynamic (changing) values in that position of the URL, like the `name`. These can also be called "URL params" or "params" in short. These can be used with the help of the `useParams` hook or with loaders and more, but we will use a basic example with useParams here. We can thus rewrite the profile component as the following:

```jsx
import { useParams } from "react-router-dom";
import DefaultProfile from "./DefaultProfile";
import Spinach from "./Spinach";
import Popeye from "./Popeye";

const Profile = () => {
  const { name } = useParams();

  return (
    <div>
      <h1>Hello from profile page!</h1>
      <p>So, how are you?</p>
      <hr />
      <h2>The profile visited is here:</h2>
      {name === "popeye" ? (
        <Popeye />
      ) : name === "Spinach" ? (
        <Spinach />
      ) : (
        <DefaultProfile />
      )}
    </div>
  );
};

export default Profile;
```

### Handling Bad Urls

But alas, the index path doesn't work with this anymore, as in the "/profile" path, no params are actually passed. Actually, the "/profile" path doesn't make much sense without an actual name, else whose profile is it supposed to show, right? So, the application shows an error! This can't be good, so how do you show a default page in case the user visits a wrong or unused path? You can pass in an `errorElement` argument here! Create a basic "Not Found" page:

```jsx
import { Link } from "react-router-dom";

const ErrorPage = () => {
  return (
    <div>
      <h1>Oh no, this route doesn't exist!</h1>
      <Link to="/">
        You can go back to the home page by click here, though!
      </Link>
    </div>
  );
};

export default ErrorPage;
```

Add in the `errorElement` to the configuration, and check it out! The "/profile", or any unmentioned paths render an error page!

```jsx
import React from "react";
import ReactDOM from "react-dom/client";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import App from "./App";
import Profile from "./Profile";
import ErrorPage from "./ErrorPage";

const router = createBrowserRouter([
  {
    path: "/",
    element: <App />,
    errorElement: <ErrorPage />,
  },
  {
    path: "profile/:name",
    element: <Profile />,
  },
]);

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
```

### Protected Routes

Often, you will face a need to decide when a certain route is rendered or not. One use case is authentication, where you may want to render certain routes based on if the user is logged in or not.

While there are many ways to do so, one of the easiest can be to do so by conditionally creating a config for the router. But before we do so, let us remove our routes to a component of their own, so that we can add whatever conditional logic we want, if it exists as a hook (remember, we can't use hooks outside of a react component!). Even if you don't have any need for a conditional rendering of routes, it is much neater nonetheless, to have them seperate. Create a new `Router.js` component and move your routes to it.

```jsx
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import App from "./App";
import Profile from "./Profile";
import ErrorPage from "./ErrorPage";

const Router = () => {
  const router = createBrowserRouter([
    {
      path: "/",
      element: <App />,
      errorElement: <ErrorPage />,
    },
    {
      path: "profile/:name",
      element: <Profile />,
    },
  ]);

  return <RouterProvider router={router} />;
};

export default Router;
```

So, we can simply add this `Router.js` component to the `index.js` file.

```jsx
import React from "react";
import ReactDOM from "react-dom/client";
import Router from "./Router";

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <Router />
  </React.StrictMode>
);
```

This seems so much nicer right? Now, coming back to the topic of authentication. Let us create a mock authentication process so we can demonstate how protected routes can be implemented. Create a `isLoggedIn` state variable in the Routes component to store if or not an user is logged in, and pass it and it's setter to the home page. This is usually managed with some function or hook, but for convenience, we can assume this to be our authentication method. So, our `Routes.js` looks like:

```jsx
import { useState } from "react";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import App from "./App";
import Profile from "./Profile";
import ErrorPage from "./ErrorPage";

const Router = () => {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const router = createBrowserRouter([
    {
      path: "/",
      element: <App isLoggedIn={isLoggedIn} setIsLoggedIn={setIsLoggedIn} />,
      errorElement: <ErrorPage />,
    },
    {
      path: "profile/:name",
      element: <Profile />,
    },
  ]);

  return <RouterProvider router={router} />;
};

export default Router;
```

Let us create two buttons, to toggle this state in `App.js`, and change the "/profile" link to a "/protected" so that it can be used to indicate a protected route.

```jsx
import { Link } from "react-router-dom";

const App = ({ isLoggedIn, setIsLoggedIn }) => {
  function login() {
    setIsLoggedIn(true);
  }

  function logout() {
    setIsLoggedIn(false);
  }

  return (
    <div>
      <h1>Hello from the main page of the app!</h1>
      <p>{isLoggedIn ? "You are logged in!" : "You are not logged in!"}</p>
      <hr />
      <button type="button" onClick={login}>
        Login
      </button> <button type="button" onClick={logout}>
        Logout
      </button>
      <hr />
      <p>Here are some examples of links to other pages</p>
      <nav>
        <ul>
          <li>
            <Link to="protected">Protected page</Link>
          </li>
        </ul>
      </nav>
    </div>
  );
};

export default App;
```

Now, let us create a component that should only be allowed to be seen by logged-in users. Let us call it `Protected.js`

```jsx
import { Link } from "react-router-dom";

const Protected = () => {
  return (
    <div>
      <p>Hey! You should only see this if you are logged in!</p>
      <p>
        <Link to="/">Click here</Link> to go back to the home page
      </p>
    </div>
  );
};

export default Protected;
```

Now, We can pass the routes conditionally to the `createBrowserRouter` methods based on if the user is logged in. Else, we can use another one of `react-router-dom`s components, `<Navigate>` to redirect the user back to another page, in this instance, let it be Popeye's profile page.

```jsx
import { useState } from "react";
import {
  createBrowserRouter,
  Navigate,
  RouterProvider,
} from "react-router-dom";
import App from "./App";
import Profile from "./Profile";
import ErrorPage from "./ErrorPage";
import Protected from "./Protected";

const Router = () => {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const routes = (condition) => [
    {
      path: "/",
      element: <App isLoggedIn={isLoggedIn} setIsLoggedIn={setIsLoggedIn} />,
      errorElement: <ErrorPage />,
    },
    {
      path: "profile/:name",
      element: <Profile />,
    },
    {
      path: "protected",
      element: condition ? <Protected /> : <Navigate to="/profile/popeye" />,
    },
  ];

  const router = createBrowserRouter(routes(isLoggedIn));

  return <RouterProvider router={router} />;
};

export default Router;
```

Here, the routes is a function that accepts a condition to see if the user is logged in. It uses that to generate a configuration of routes which are then passed on to the `createBrowserRouter` method to finally make the router.

### Assignment

<div class="lesson-content__panel" markdown="1">

1.  [This article](https://bholmes.dev/blog/spas-clientside-routing/) by Ben Holmes goes through a lot of the routing concepts concisely.
2.  Go and add a few new routes to the application we created above; playing around with it is the best practice. Consider deleting it completely and rewriting it for practice.
3.  The [React Router tutorial](https://reactrouter.com/en/6.7.0/start/tutorial) goes through a lot of the stuff discussed in this lesson and much more. Have a read into it, and ask about, if you don't understand something. You are not expected to understand most of it in your first read.
4.  Browse through the [React Router documentation](https://reactrouter.com/en/6.7.0). Again, you don't need to read through all of it, nor understand all of it. Just browse through the concepts we discussed here and re-read them. Look into the other features that React Router offers. This is a great resource to refer back to.

</div>

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- <a class="knowledge-check-link" href="#client-side-routing">What does client-side routing mean?</a>
- <a class="knowledge-check-link" href="#adding-a-router">How do you set up a basic router?</a>
- <a class="knowledge-check-link" href="#the-link-element">What should be used in place of "a" tags to enable client-side routing?</a>
- <a class="knowledge-check-link" href="#nested-routes-outlets-and-dynamic-segments">How do you create nested routes?</a>
- <a class="knowledge-check-link" href="#dynamic-segments">What do you mean by dynamic segments or URL params?</a>
- <a class="knowledge-check-link" href="#handling-bad-urls">How do you add a "catch-all" route?</a>
- <a class="knowledge-check-link" href="#protected-routes">How do you create protected routes?</a>

### Additional Resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
