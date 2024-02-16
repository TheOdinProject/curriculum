### Introduction

Up until this point in the curriculum, we have been building one-page applications. However, for any larger scale application, we are going to have multiple pages. Thankfully, the browser allows client-side Javascript to manage the way a user can navigate, with the [History API](https://developer.mozilla.org/en-US/docs/Web/API/History_API/Working_with_the_History_API). We can leverage the power of this to manage routing in React with the help of a package like React Router.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- What is client-side routing?
- How do you use React Router to do client-side routing?
- How do you create nested and dynamic paths?
- How do you add a "catch-all" route?
- How do you add protected routes?

### Client-side routing

Client-side routing is the type of routing where Javascript takes over the duty of handling the routes in an application. Client-side routing helps in building single-page applications (SPAs) without refreshing as the user navigates. For example, when a user clicks a navbar element, the URL changes and the view of the page is modified accordingly, within the client.

Say you are cooking some chicken. If you want to cook it well and nice, you will have to:

1. Put the chicken in the oven and set it to cook with appropriate time and heating
2. Wait till the dish gives out that satisfying smell
3. Start munching!

This is common to all websites, you set the oven up for what you want (visit any URL, like [https://theodinproject.com/](https://theodinproject.com/)), wait for the oven to be done with the cooking (the loading screen), and tada, enjoy your delicious food (your page is ready for use). But what if you forgot to add some spices before you cooked it up? You have to repeat this flow again:

1. Get up from your seat
2. Add the spices to the chicken
3. Go back to the oven, put the chicken back in and set it up to be reheated
4. Wait for it to be nice and warm
5. Now you can eat it!

Here is where we reiterate, **you need to get up from your seat**. In a general multi-page application (MPAs), the browser reloads every time you click on a link to navigate. With client-side routing, **you never leave the page you are on** - you bring a microwave to the table to ensure that you don't have to get up from your seat should you ever run into the "missing spices" issue. The link requests are intercepted by the Javascript that you write, instead of letting them go directly to the server.

### A Reactive solution

While client-side routing allows for nicer, app-like interactions (since you are controlling the routes, you can make fancy CSS animations across route changes), a lot of caveats can be missed. When a browser reloads, it notifies screen-readers of new content to read, but in the case of client-side routing, you will need to notify screen-readers of route updates manually. However, with the help of a robust library, you can often address these concerns!

React Router is a standard routing library for React applications. By using React Router, we can specify React components, that can be rendered based on the route, and so much more. Let's dive in!

### Adding a router

Let's make a small app to understand how this router is implemented. Create a new React project and let's start by adding some mock pages as an example. Create a new `Profile.jsx` file with the following component:

~~~jsx
const Profile = () => {
  return (
    <div>
      <h1>Hello from profile page!</h1>
      <p>So, how are you?</p>
    </div>
  );
};

export default Profile;
~~~

Replace the `App.jsx` file with some basic content too:

~~~jsx
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
~~~

Now it's time to add the router! There's a couple of ways of defining our app's routes, but in **React Router v6.7.0 or higher**, it is recommended to add routes as objects. 

Let us install the React Router package:

`npm install react-router-dom`

Add the following to `Main.jsx`, we will talk about what is happening in a little bit.

~~~jsx
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
    path: "profile",
    element: <Profile />,
  },
]);

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
~~~

Once this is done, go ahead and run `npm run dev` and check out both routes: the home route `/` and the profile route `/profile` It works! But what is happening here?

1. We import `createBrowserRouter` and `RouterProvider` from React Router.
2. `createBrowserRouter` is used to create the configuration for a router by passing arguments in the form of an array of routes.
3. The configuration array contains objects with two mandatory keys, the path and the corresponding element to be rendered.
4. This generated configuration is then rendered in, by passing it to the `RouterProvider` component.

### The link element

But you may notice, when we click the links in the navbar, the browser is reloading for the next URL instead of using React Router. This isn't what was promised! To help with this, [React Router exports a custom `Link` element](https://reactrouter.com/en/main/components/link) to be used instead of the regular `a` tag. We can replace the `a` tag in our navbar with the `Link` element.

~~~jsx
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
~~~

And now, we don't get the browser reloading every time we click the link on the navbar!

### Nested routes, outlets and dynamic segments

Now, what if you want to render a section of a page differently, based on different URLs? This is where nested routes come into play! We can add routes nested as the children of one another to ensure that the child gets rendered alongside the parent. Create a couple of components, `Popeye.jsx` and `Spinach.jsx`.

~~~jsx
import { Link } from "react-router-dom";

const Popeye = () => {
  return (
    <>
      <p>Hi, I am Popeye! I love to eat Spinach!</p>
      <Link to="/">Click here to go back</Link>
    </>
  );
};

export default Popeye;
~~~

~~~jsx
import { Link } from "react-router-dom";

const Spinach = () => {
  return (
    <>
      <p>Hi, I am Spinach! Popeye loves to eat me!</p>
      <Link to="/">Click here to go back</Link>
    </>
  );
};

export default Spinach;
~~~

Now, we can rewrite the routes as given:

~~~jsx
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
~~~

This allows us to render the child component alongside the parent, through an [`Outlet`](https://reactrouter.com/en/main/components/outlet)! We can rewrite the Profile component to add an `Outlet` which will get replaced by the various profiles when that route is visited!

~~~jsx
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
~~~

Check out the `/profile`, `/profile/popeye` and `/profile/spinach` pages. The `<Outlet />` component gets replaced with the children component when their paths are visited.

If you want to render something as a default component when no path is added to Profile, you can add an index route to the children! 

Create a DefaultProfile component:

~~~jsx
const DefaultProfile = () => {
  return <p>Oh, nothing to see here!</p>;
};

export default DefaultProfile;
~~~

Now, add an index tag with the DefaultProfile as a child to the `/profile` route.

~~~jsx
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
~~~

If you visit the `/profile` path now, you should be able to see some default content where the `Outlet` is rendered when the index path is rendered!

But this example brings another dilemma. Sometimes, we want to render content according to the URLs. That, here, would mean that we should be able to render content dynamically, from the component itself. Thankfully, you can do so with dynamic segments! Change the routes to be the following:

~~~jsx
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
~~~

The colon (:) turns the path section after it into a <span id="dynamic-segments">"dynamic segment"</span>. Dynamic segments will match dynamic (changing) values in that position of the URL, like the `name`. These can also be called "URL params" or "params" in short. These can be used with the help of the `useParams` hook. We can thus rewrite the Profile component as the following:

~~~jsx
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
      ) : name === "spinach" ? (
        <Spinach />
      ) : (
        <DefaultProfile />
      )}
    </div>
  );
};

export default Profile;
~~~

### Handling bad urls

But alas, the index path doesn't work with this anymore, as in the `/profile` path, no params are actually passed. Actually, the `/profile` path doesn't make much sense without an actual name, else whose profile is it supposed to show, right? So, the application shows an error! This can't be good, so how do you show a default page in case the user visits a wrong or unused path? You can pass in an `errorElement` argument here! Create a basic "Not Found" page:

~~~jsx
import { Link } from "react-router-dom";

const ErrorPage = () => {
  return (
    <div>
      <h1>Oh no, this route doesn't exist!</h1>
      <Link to="/">
        You can go back to the home page by clicking here, though!
      </Link>
    </div>
  );
};

export default ErrorPage;
~~~

Add the `errorElement` to the configuration, and verify that it renders an error page by going to the `/profile` path or any unmentioned paths. We'll wire this back up in the assignment.

~~~jsx
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
~~~

### Refactoring the routing

Let's refactor our routes to a component of their own. By refactoring, we can add whatever conditional logic we want, if it exists as a hook (remember, we can't use hooks outside of a React component!). It's much neater to have them separate even if you are not conditionally rendering routes.

Create a new `Router.jsx` component and move your routes to it:

~~~jsx
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
~~~

Add `Router.jsx` component to the `Main.jsx` file:

~~~jsx
import React from "react";
import ReactDOM from "react-dom/client";
import Router from "./Router";

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <Router />
  </React.StrictMode>
);
~~~

Much nicer! 

### Protected routes and navigation

Often, you will need to decide whether a certain route should be rendered or not. One example is authentication, where you render certain routes based on if the user is logged in or not. If they are logged in, you show some information about the user like [here at The Odin Project dashboard page](https://www.theodinproject.com/dashboard). Otherwise, they are redirected to the sign-in page (this could be any page). While there are many ways to do so, one of the easiest ways is to conditionally create a config for the router.

You will often come across the need to reroute the user to a different URL programmatically. This is where we use [the `<Navigate />`component](https://reactrouter.com/en/main/components/navigate). The `<Navigate />` component reroutes the user to the desired URL when it is rendered. It is a wrapper around [the useNavigate hook](https://reactrouter.com/en/main/hooks/use-navigate) that lets you navigate programmatically, to URLs, or even go back down the user's history.

### Conclusion

You should now have enough basics to get started with React routing. There are a lot more features to react-router-dom which are extremely useful, but out of the scope of this lesson. We're confident that the concepts covered above should be enough to get you through the React course. If you are interested in learning some more, we recommend you look into the history or match object. Definitely go and check out more advanced concepts once you are familiar with the basics.

### Assignment

<div class="lesson-content__panel" markdown="1">

1.  [This article on SPAs and client-side routing by Ben Holmes](https://bholmes.dev/blog/spas-clientside-routing/) goes through a lot of the routing concepts concisely.
2.  Go and fix the `/profile` page to display something more useful than an error page. Then, add a few new routes to the application we created above; This was a dense lesson, so take some time to play with the new tools you've learned. Consider deleting it completely and rewriting it using what you know.
3.  The [React Router tutorial](https://reactrouter.com/en/main/start/tutorial) goes through a lot of the stuff discussed in this lesson and much more. Have a read through the sections up to "Nested Routes".
4.  Browse through the [React Router documentation](https://reactrouter.com/en/main). Again, you don't need to read through all of it, nor understand all of it. Just browse through the concepts we discussed here and re-read them. Look into the other features that React Router offers. This is a great resource to refer back to.

</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- <a class="knowledge-check-link" href="#client-side-routing">What does client-side routing mean?</a>
- <a class="knowledge-check-link" href="#adding-a-router">How do you set up a basic router?</a>
- <a class="knowledge-check-link" href="#the-link-element">What should be used in place of "a" tags to enable client-side routing?</a>
- <a class="knowledge-check-link" href="#nested-routes-outlets-and-dynamic-segments">How do you create nested routes?</a>
- <a class="knowledge-check-link" href="#dynamic-segments">What do you mean by dynamic segments or URL params?</a>
- <a class="knowledge-check-link" href="#handling-bad-urls">How do you add a "catch-all" route?</a>
- <a class="knowledge-check-link" href="#protected-routes-and-navigation">How do you create protected routes?</a>

### Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- Among the many ways to make protected routes, a few ways are provided below:
    - [This Stack Overflow answer](https://stackoverflow.com/a/64347082/19051112) uses a function to generate the route config object passed to `createBrowserRouter`. The function conditionally generates the different paths.
    - [This demonstration project](https://github.com/iammanishshrma/react-protected-routes/blob/master/src/routes/ProtectedRoute.jsx) creates a special Protected Route component that conditionally displays elements as necessary.
