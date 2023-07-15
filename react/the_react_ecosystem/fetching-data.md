### Introduction

Up to this point we have been using React to build client side applications with interactive user interfaces, but what if we want fetch data from the internet? In order to create full fledged web applications, we need some way to get data from external sources and dynamically displaying it on the client.

In this lesson, we'll explore the ins and outs of fetching data in React, starting with the basics of making API calls, managing component state, and handling asynchronous operations using JavaScript's ~fetch~ function.

### Lesson Overview

This section contains a general overview of topics that you will learn in this lesson.

- Understand how to make fetch requests in React components.
- Using conditonals to render content depending on the state of the request (short circuiting).
- Catching and handling errors.
- Lifting requests up the component hierarchy.

### A basic fetch request

Before we dive into the specifics of fetching data in React, let's first revisit how we can use the fetch API to get data from a server.

<!-- fetch is used to make requests to external APIs and returns a Promise that resolves to the response object representing the server's response. -->

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

We're making a request to the JSONPlaceholder API to retrieve an image. The response is then converted to JSON format using the json() method, and then we set the image src to the url embedded in that response object. The catch method is used to catch any errors that may occur during the request.

### Using Fetch in React Components

Now let's take a look at how we can incorporate fetch into a similar React component. One common use case is to fetch data from an API when a component mounts, so that the data can be displayed on screen.

Whenever a component needs to make a request as it renders, it's often best to wrap that fetch inside of an effect.

**https://codesandbox.io/s/top-simple-react-request-rd9psp?file=/src/styles.css**

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

useState lets us bundle data within a component and rerender the component whenever state is updated, and useEffect allows us to perform side effects on those components. Since we need to synchronize this component's state (the image URL) with an unpredictable external system like the fetch API, we need an effect. In this case we only want to fetch the URL once when the component is first mounted so we pass an empty array as a dependency to useEffect.

> Reminder: Whenever you are changing state, (or doing anything else that could cause a rerender) inside of useEffect, be sure to always pass a dependency. If you forget to do so useEffect will enter an infinite loop and rerender exponentially.

You might be wondering what's going on here

~~~jsx
return (
  imageURL && (
    <>
      <h1>An image</h1>
      <img src={imageURL alt={"placeholder text"}}>
    </>
  )
)
~~~

This is a pattern called _short circuiting_ and it allows developers to conditionally render JSX without using if statements or ternarys. The above snippet can be read as, "if imageURL is truthy then continue to evaluate the expression". A truthy value and an object evaluates to the object so in this case, JSX is returned. If imageURL was falsy, the right hand side of the && operation wouldn't evaluate and the component would return false.

### Handling Errors

Working over the network is inherently unreliable. The API you're making a request to might be down, there could be network connectivity issues, or the response you recieve could contain errors. Any number of things can go wrong and if you don't preemptively plan for errors, your website can break or appear unresponsive to users. To simulate a network error, scroll up to that previous code snippet and change the fetch url to something random. The page will remain a white screen without giving the user any indication that the page has finished loading or that there was an error.

To fix this, we need to check _something_ in the return of the Image component. We'll call it "error".

~~~jsx
  return (
    <>
      {error && <p>A network error was encountered</p>}
      {imageURL && (
        <>
          <h1>An image</h1>
          <img src={imageURL} alt={"placeholder text"} />
        </>
      )}
    </>
  );
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

> Note: A fetch request can return an http error without triggering the catch block. Always be sure to check your response and manually throw an error

Now when a bad URL is passed or the API returns an unexpected response, the page will relay that information to the user. 

**https://codesandbox.io/s/top-simple-react-request-with-error-fqjcrq?file=/src/Image.jsx**

#### Managing Multiple Fetch Requests

In a full scale web app you're often going to be making more than one request and you need to be careful with how you organize them. A common issue new react developers face when their apps start making multiple requests is called a waterfall of requests. Let's look at an example.

**https://codesandbox.io/s/top-multiple-requests-with-waterfall-j92h8m**

~~~jsx
// App.jsx
const App = () => {
  return <Profile delay={1000} />;
};

// Profile.jsx
const Profile = ({ delay }) => {
  const [imageURL, setImageURL] = useState(null);

  useEffect(() => {
    setTimeout(() => {
      fetch("https://jsonplaceholder.typicode.com/photos", { mode: "cors" })
        .then((response) => response.json())
        .then((response) => setImageURL(response[0].url))
        .catch((error) => console.error(error));
    }, delay);
  }, [delay]);

  return (
    (imageURL && (
      <div>
        <h3>Username</h3>
        <img src={imageURL} alt={"profile"} />
        <Bio delay={1000} />
      </div>
    )) || <h1>Loading...</h1>
  );
};

// Bio.jsx
const Bio = ({ delay }) => {
  const [bioText, setBioText] = useState(null);

  useEffect(() => {
    setTimeout(() => {
      fetch("https://jsonplaceholder.typicode.com/photos", { mode: "cors" })
        .then((response) => response.json())
        .then((response) =>
          setBioText("I like long walks on the beach and JavaScript")
        )
        .catch((error) => console.error(error));
    }, delay);
  }, []);

  return (
    bioText && (
      <>
        <p>{bioText}</p>
      </>
    )
  );
};
~~~

We have 2 components making fetch requests; Profile and it's child component Bio. The requests in Profile and Bio are both firing inside of their respective components. On the surface this looks like a well organized separation of concerns but in this case, it comes at a cost in performance.

~~~jsx
// Profile.jsx
const [imageURL, setImageURL] = useState(null);
...
 return (
    imageURL && (
      <div>
        <h3>Username</h3>
        <img src={imageURL} alt={"profile"} />
        <Bio delay={1000}/> Important
      </div>
    ) || <h1>Loading...</h1>
  );
~~~

Notice how Bio is taking an extra second to display? Their fetch requests should both take 1000ms to resolve so what's going on?? In React none of the hooks, JSX, or code inside of a component will be run until that component is due to render. Bio has to wait for the request inside of Profile to resolve before it starts rendering which means the request inside Bio isn't sent.

If we remove the short circuiting conditional that waits for imageURL Bio would send a request immediately, but that would mean abandoning our loading screen. Instead of compromising on design we can lift the request up the component tree and pass it's response as a prop to Bio.

**https://codesandbox.io/s/top-multiple-requests-no-waterfall-msrvvh?file=/src/Profile.jsx**

~~~jsx
// Profile.jsx
const Profile = ({ delay }) => {
  const [imageURL, setImageURL] = useState(null);
  const [bioText, setBioText] = useState(null);

  useEffect(() => {
    setTimeout(() => {
      fetch("https://jsonplaceholder.typicode.com/photos", { mode: "cors" })
        .then((response) => response.json())
        .then((response) => setImageURL(response[0].url))
        .catch((error) => console.error(error));
    }, delay);

    setTimeout(() => {
      fetch("https://jsonplaceholder.typicode.com/photos", { mode: "cors" })
        .then((response) => response.json())
        .then((response) =>
          setBioText("I like long walks on the beach and JavaScript")
        )
        .catch((error) => console.error(error));
    }, delay + 2000); // here we add an extra 2 seconds of delay
  }, [delay]);

  return (
    (imageURL && (
      <div>
        <h3>Username</h3>
        <img src={imageURL} alt={"profile"} />
        <Bio bioText={bioText} />
      </div>
    )) || <h1>Loading...</h1>
  );
};

// Bio.jsx
const Bio = ({ bioText }) => {
  return (
    bioText && (
      <>
        <p>{bioText}</p>
      </>
    )
  );
};
~~~

Now we have both requests firing as soon as Profile renders. The request for imageURL resolves 2 seconds before the bioText request and our div containing <Bio /> renders. When bioText resolves an update will be made in state which will trigger a rerender in <Bio />, adding that text description to the page.

### Data fetching libraries

!TODO React Query section

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read [Modern API data fetching methods](https://blog.logrocket.com/modern-api-data-fetching-methods-react/) for a brief overview of what was discussed in this lesson. 
2. Read [How to fetch data in React with performace in mind](https://www.developerway.com/posts/how-to-fetch-data-in-react) to learn more about efficiently handling fetch requests in React components.


</div>

### Knowledge Check

This section contains questions for you to check your understanding of this lesson on your own. If you’re having trouble answering a question, click it and review the material it links to.

- <a class="knowledge-check-link" href="#using-fetch-in-react-components">How can you fetch data from an API in React?</a>
- <a class="knowledge-check-link" href="#handling-errors">Why should you manually throw errors in fetch requests?</a>
- <a class="knowledge-check-link" href="#managing-multiple-fetch-requests">How can you avoid waterfalling requests?</a>

## Additional resources

This section contains helpful links to related content. It isn’t required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
