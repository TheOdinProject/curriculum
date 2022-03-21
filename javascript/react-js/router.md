### Introduction

In this lecture we are going to learn a little bit about routing in React. Up until now we have only written one-page applications. Once your application has multiple pages, you need to set up a reliable routing system. This is to handle the component or page that should be rendered when navigating to a certain route. For this we are going to use a package called `react-router-dom`.

### Learning Outcomes
By the end of this lesson, you should be able to:

- Explain how `react-router-dom` works

### React Router

Let's go through it step by step. First of all, create a new project using `create-react-app` and get rid of the boilerplate code as you already learned in previous lessons. (Just leave the index.js and the App.js files)

Once you've done that, let's create a new file called `Profile.js` inside the src directory, and add a basic functional component to it, which just contains an `h1` element.

~~~javascript
const Profile = () => {
  return (
    <div>
      <h1>Hello from Profile</h1>
    </div>
  );
};

export default Profile;
~~~

And also make sure your `App.js` file looks like this:

~~~javascript
const App = () => {
  return (
    <div>
      <h1>Hello from App</h1>
    </div>
  );
};

export default App;
~~~

Once you have this, install the package. Open a terminal and run `npm i react-router-dom`. This is going to install all the dependencies for us.
While this is happening, we can create a new file called `RouteSwitch.js`, which is going to be the file that handles our routes.

Once the package is finished installing, you can add this code to your RouteSwitch.js file:

~~~javascript
import { BrowserRouter, Routes, Route } from "react-router-dom";
import App from "./App";
import Profile from "./Profile";

const RouteSwitch = () => {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<App />} />
        <Route path="/profile" element={<Profile />} />
      </Routes>
    </BrowserRouter>
  );
};

export default RouteSwitch;
~~~

<span id="components">So what is happening here?</span> First we are importing React, our two components (Profile and App), and a few things from the package we just installed:

1. **Route**: Those are our routes with a path, which equals the url path, and a component that should be rendered when we navigate to this url.

2. **BrowserRouter**: Is a router, which uses the history API (`pushState`, `replaceState` and the `popstate` event) to keep your UI in sync with the URL. For completion we have to mention that there are other options than `BrowserRouter`, but for your current projects you can assume that `BrowserRouter` is at the root of all your projects.

3. <span id="routing">**Routes**: Renders the first child Route that matches the location. In other words, the `Routes` component is going to look through all your Routes and checks their path. The first Route, whose path matches the url *exactly* will be rendered; all others will be ignored. Important to note is that in previous versions of `react-router-dom` the `exact` keyword was needed to achieve this behavior.</span>

Let's check this behavior in the browser for better understanding. But before we do that we have to do one more thing: change our `index.js` file. This is because we don't want our `App.js` file to be the first file to be called when our application runs. Instead, we want our `RouteSwitch.js` to be the first. Your `index.js` should look something like this:

~~~javascript
import React from "react";
import ReactDOM from "react-dom";
import RouteSwitch from "./RouteSwitch";

ReactDOM.render(
  <React.StrictMode>
    <RouteSwitch />
  </React.StrictMode>,
  document.getElementById("root")
);
~~~

Once this is done, go ahead and run `npm start` and check out both routes: the home route "/" and the profile route "/profile". Do this by changing the url in the browser accordingly.

You should now have enough basics to get started with React routing. There are a lot more features to react-router-dom which are extremely useful, but out of the scope of this lesson. If you are interested in learning some more, we recommend you look into the history or match object. Definitely go and check out more advanced concepts once you are familiar with the basics.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Go and add a few new routes to the application we created above; playing around with it is the best practice. Consider deleting it completely and rewriting it for practice.
2. Browse a little bit through the React Router [documentation](https://reactrouter.com/docs/en/v6/getting-started/overview). You don't need to read through all of it, nor understand all of it. Just browse through the concepts we discussed here and re-read them. This is a great resource to refer back to.
3. Watch [this](https://www.youtube.com/watch?v=Law7wfdg_ls) video for reviewing. You should already be familiar with those concepts.
</div>

### Additional Resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.

- [This video by The Net Ninja](https://www.youtube.com/watch?v=QUz3k2O3ZJU&ab_channel=TheNetNinja) is an excellent review of what we learned here.
- For some extra practice/review, check out [this article](https://css-tricks.com/learning-react-router/).

### Knowledge Checks

This section contains questions for you to check your understanding of this lesson. If you're having trouble answering the questions below on your own, review the material above to find the answer.

- <a class="knowledge-check-link" href="#react-router">How do you add page routing to a React project?</a>
- <a class="knowledge-check-link" href="#components">What are the three core components of React Router?<a>
- <a class="knowledge-check-link" href="#routing">How do you ensure that Router links are routed accurately?</a>

