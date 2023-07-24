### Introduction

Up to this point we have been using React to build client side applications with interactive user interfaces, but what if we want to fetch data from the internet? In order to create full-fledged web applications, we need some way to get data from external sources and dynamically display it.

In this lesson, we'll explore the ins and outs of fetching data in React, starting with the basics of making API calls, managing component state, and handling asynchronous operations using JavaScript's `fetch` function.  You've already performed data fetching in earlier projects, so some stuff covered in the lesson will be familiar to you. Revision doesn't hurt!

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Understand how to make fetch requests in React components.
- Catching and handling errors.
- Lifting requests up the component hierarchy.

### A basic fetch request

Before we dive into the specifics of fetching data in React, let's briefly revisit how we can use the fetch API to get data from a server.

~~~js
const image = document.querySelector("img");
fetch("https://jsonplaceholder.typicode.com/photos", {
  mode: "cors",
})
  .then((response) => response.json())
  .then((response) => {
    img.src = response[0].url;
  })
  .catch((error) => console.error(error));
~~~

We're making a request to the JSONPlaceholder API to retrieve an image, and then setting that URL to the src of an `<img>` element.  

### Using fetch in React components

Now let's take a look at how we can incorporate fetch into a similar React component. One common use case is to fetch data from an API when a component mounts, so that the data can be displayed on screen.

Whenever a component needs to make a request as it renders, it's often best to wrap that fetch inside of an effect.


~~~jsx
import { useEffect, useState } from "react";

const Image = () => {
  const [imageURL, setImageURL] = useState(null);

  useEffect(() => {
    fetch("https://jsonplaceholder.typicode.com/photos", { mode: "cors" })
      .then((response) => response.json())
      .then((response) => setImageURL(response[0].url))
      .catch((error) => console.error(error));
  }, []);

  return (
    imageURL && (
      <>
        <h1>An image</h1>
        <img src={imageURL} alt={"placeholder text"} />
      </>
    )
  );
};

export default Image;
~~~

`useState` lets us add the `imageURL` state, whereas `useEffect` allows us to perform side effects. In this case, the side effect is fetching data from an external API. Since we only need to fetch once when component mounts, we pass an empty dependency array.

### Handling errors

Working over the network is inherently unreliable. The API you're making a request to might be down, there could be network connectivity issues, or the response you receive could contain errors. Any number of things can go wrong and if you don't preemptively plan for errors, your website can break or appear unresponsive to users. To simulate a network error, scroll up to that previous code snippet and change the fetch url to something random. The page will remain a white screen without giving the user any indication that the page has finished loading or that there was an error.

To fix this, we need to check for _something_ before Image component returns JSX. We'll call it "error".

~~~jsx
  if (error) return <p>A network error was encountered</p>

  return (
    imageURL && (
      <>
        <h1>An image</h1>
        <img src={imageURL} alt={"placeholder text"} />
      </>
    )
  );
};
~~~

To set this error, we'll add it to the component's state.

~~~jsx
const [imageURL, setImageURL] = useState(null);
const [error, setError] = useState(null);
~~~

And finally, to give error a value when a request fails, we'll add a conditional to check the response status and set it where our console.error line was.

~~~jsx
useEffect(() => {
  fetch("https://jsonplaceholder.typicode.com/photos", { mode: "cors" })
    .then((response) => {
      if (response.status >= 400) {
        throw new Error("server error");
      }
      return response.json();
    })
    .then((response) => setImageURL(response[0].url))
    .catch((error) => setError(error));
}, []);
~~~

<div class="lesson-note" markdown="1" >

Notice how we also have error handling in the `then` block? This is because the `fetch` request itself might not error out, but rather the request is successful and we get a response. The response though could be not our app expected. We handle this case by checking the response status codes.

</div>

Now when a bad URL is passed or the API returns an unexpected response, the page will relay that information to the user. 


#### Loading state

In the same way we added an `error` value in state to check for errors, we can add a `loading` value to check if the request is resolved or not.

~~~jsx
const Image = () => {
  const [imageURL, setImageURL] = useState(null);
  const [error, setError] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch("https://jsonplaceholder.typicode.com/photos", { mode: "cors" })
      .then((response) => {
        if (response.status >= 400) {
          throw new Error("server error");
        }
        return response.json();
      })
      .then((response) => setImageURL(response[0].url))
      .catch((error) => setError(error))
      .finally(() => setLoading(false));
  }, []);

  if (error) return <p>A network error was encountered</p>;
  if (loading) return <p>Loading...</p>;

  return (
    <>
      <h1>An image</h1>
      <img src={imageURL} alt={"placeholder text"} />
    </>
  );
};
~~~

### Using custom hooks 

We can separate out the fetching logic altogether into a custom hook. This will allow us to make the logic reusable and easily testable.

Here's how we would do it for our example:

~~~jsx
import { useState, useEffect } from "react";

const useImageURL = () => {
  const [imageURL, setImageURL] = useState(null);
  const [error, setError] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch("https://jsonplaceholder.typicode.com/photos", { mode: "cors" })
      .then((response) => {
        if (response.status >= 400) {
          throw new Error("server error");
        }
        return response.json();
      })
      .then((response) => setImageURL(response[0].url))
      .catch((error) => setError(error))
      .finally(() => setLoading(false));
  }, []);

  return { imageURL, error, loading };
};

const Image = () => {
  const { imageURL, error, loading } = useImageURL();

  if (error) return <p>A network error was encountered</p>;
  if (loading) return <p>Loading...</p>;

  return (
    <>
      <h1>An image</h1>
      <img src={imageURL} alt={"placeholder text"} />
    </>
  );
};
~~~

If we ever needed to fetch images in different components, instead of rewriting all of that fetching logic we could simply call `useImageURL`.

### Managing multiple fetch requests

In a full scale web app you're often going to be making more than one request and you need to be careful with how you organize them. A common issue new React developers face when their apps start making multiple requests is called a _waterfall of requests_. Let's look at an example.

<iframe style="border: 1px solid rgba(0, 0, 0, 0.1);border-radius:2px;" width="800" height="450" src="https://codesandbox.io/p/sandbox/github/TheOdinProject/react-examples/tree/main/fetching-data-example?file=%2Fsrc%2FProfile.jsx%3A1%2C1&embed=1" allowfullscreen></iframe>

We have 2 components making fetch requests: Profile and its child component Bio. The requests in Profile and Bio are both firing inside of their respective components. On the surface this looks like a well organized separation of concerns but in this case, it comes at a cost in performance.


Notice how `Bio` is taking an extra second to display? Their fetch requests should both take 1000ms to resolve so what's going on?? In React, the component is not rendered until it is actually called. If JSX has conditional logic, the false branches will never render until they become true. `Bio` has to wait for the request inside of `Profile` to resolve before it starts rendering which means the request inside `Bio` isn't sent.

If we remove the short circuiting conditional that waits for `imageURL`, `Bio` would send a request immediately, but that would mean abandoning our loading screen. Instead of compromising on design we can lift the request up the component tree and pass its response as a prop to `Bio`.  

To see this in action go back to that embedded codesandbox and comment out the current `Profile` and `Bio` components and uncomment the currently commented ones. 

Now we have both requests firing as soon as `Profile` renders. The request for `imageURL` resolves 2 seconds before the `bioText` request and our div containing `<Bio />` renders. When `bioText` resolves an update will be made in state which will trigger a rerender in `<Bio />`, adding that text description to the page.

<div class="lesson-note lesson-note--warning" markdown="1" >

In all of the code examples above, we added an artificial `delay` with the `setTimeout` function. You've guessed it by now, but it's to help you walkthrough the data fetching basics in the lesson. We recommend you remove the `delay`s and play around with the code examples once more to cement the concepts.

</div>

### Data fetching libraries

We haven't even begun to scratch the surface of data fetching in the frontend. Keeping your frontend data most up-to-date with the server is a difficult task to accomplish. Managing "async" state becomes harder with every new feature. 

You've already tasted the complexity of data fetching in this lesson. Each request has to have a _minimum_ of three states to achieve an optimal user experience: `data`, `loading`, and `error`. There's a library called [TanStack Query](https://tanstack.com/query/latest/docs/react/overview) that helps you in data fetching and more. It keeps track of all the necessary states for you, and has built-in support for major features like caching.

Query is a great library to learn, however, we strongly suggest you stick to vanilla React data fetching for all the projects you build in this course. The lessons you will learn will be while doing so will be invaluable.


### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read [Modern API data fetching methods](https://blog.logrocket.com/modern-api-data-fetching-methods-react/) for a brief overview of what was discussed in this lesson. 
2. Read [How to fetch data in React with performance in mind](https://www.developerway.com/posts/how-to-fetch-data-in-react) to learn more about efficiently handling fetch requests in React components.


</div>

### Knowledge check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- <a class="knowledge-check-link" href="#using-fetch-in-react-components">How can you fetch data from an API in React?</a>
- <a class="knowledge-check-link" href="#handling-errors">Why should you manually throw errors in fetch requests?</a>
- <a class="knowledge-check-link" href="#managing-multiple-fetch-requests">How can you avoid waterfalling requests?</a>

## Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- [TanStack Query documentation](https://tanstack.com/query/latest/docs/react/overview)
