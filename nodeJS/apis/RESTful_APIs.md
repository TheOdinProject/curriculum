### Introduction

Up until now you have been creating a server to serve your assets like HTML, CSS and JavaScript. But you have also learnt about React and client-side navigation - here is where we come to understand why. In about the last decade, a specific pattern for developing websites has gained a lot of popularity. Instead of creating an app that hosts both the database and view templates, one can separate these concerns into separate projects, hosting their backend and database on a server (either on something like [Heroku](https://www.heroku.com/) or on a VPS like [Digital Ocean](https://www.digitalocean.com/)), then using a service such as [GitHub Pages](https://pages.github.com/) or [Netlify](https://www.netlify.com/) to host their frontend.

This technique is sometimes referred to as the [Jamstack](https://jamstack.org/what-is-jamstack/). The most glaring benefit to this architecture lies in its seperation of the business logic and view logic. This allows you to use a singular backend as a source of data for whatever frontend application(s) you want. You can send data to a website, a desktop app and a mobile app with the same backend.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Understand what makes an API RESTful.
- Detail the naming conventions for RESTful API endpoints.
- Reinforcing what HTTP methods/verbs are.
- Understand the different components of an URL.
- Recognising RESTful APIs from examples.

### HTTP

HTTP can be roughly defined as the layer that acts as a protocol for a request-and-response mode of communication between a client (here, browser) and a server. If you open up the network tab in the developer tools of your browser and refresh the page, you will notice a long list of items. These are loosely referred to as "resources" - a thing in the database of your server, that the browser is asking for, as a request, and getting as a response.

Clicking on any one of these items will let you see further details about them. Notice that each of these requests and responses have a header and (usually) a body component. The header is responsible for information about the request/reponse itself, like the address to send/receive from, the kind of information being carried/asked for, and more. The body on the other hand contains the data added to the request/response, like the response to a form or authentication tokens in requests or the page itself in responses.

### CRUD and HTTP methods

By now you have probably heard about the word CRUD. Broadly, an API is responsible to provide four functions on any resource - **c**reating it, **r**eading about it, **u**pdating it and **d**eleting it. CRUD describes the actions that you can have on a resource, if your action cannot be described by any of these four, then it could probably be its own model. A key component of any request is to understand what kind of function it wants, amongst these four.

Instead of having a naming convention like `/getPosts` or `/setPosts`, a request directly refers to the resource itself (here, `/posts`) and a corresponding HTTP method (colloquially called HTTP verbs, since they are verbs, grammatically). The methods are as follows:

| Method | Action | Example                                         |
| ------ | ------ | ----------------------------------------------- |
| POST   | Create | `POST /posts` - Creates a new blog post         |
| GET    | Read   | `GET /posts/:postid` - Fetches a single post    |
| PUT    | Update | `PUT /posts/:postid` - Updates a single post    |
| DELETE | Delete | `DELETE /posts/:postid` - Deletes a single post |

There are usually 2 URI's for a resource - one for the entire collection and one for a single object in the collection. One can `GET /posts` for all of the posts or `GET /posts/:postid` for one of them. Nesting URIs further is entirely possible, `GET /post/:postid/comments` can get all the comments for a post or `GET /post/:postid/comments/:commentid` can get a specific comment on a specific post.

### HTTP response codes

Every response from a server has a response code that provides quick and basic context regarding the response itself to the client. They are classified into five classes:

#### Status codes 100 - 199: Informational responses

Introduced by the HTTP/1.1 standard, these simply represent that a request was received and understood, mostly used on a provisional basis while the request processing continues. It simply alerts the client to wait on a final response.

#### Status codes 200 - 299: Successful responses

These tell the client that a request was successfully received and processed.

- `200 OK`: It is the default to indicate a successful request. The result and response depends on the HTTP method, like sending the resource in the body for a `GET` request or describing the created entity for a `POST` request.
- `202 Accepted`: Indicates that a request was accepted but is being processed. No further context is attached to the response, like if it will be acted on eventually or not.

#### Status codes 300 - 399: Redirection messages

Whenever additional action is needed to complete the request, it is indicated to the client with this class of status codes. A major use case for these is URL redirection.

- `301 Moved Permanently`: Denotes the permanent relocation of any resource to a different URL, while adding the new URL to the response.

#### Status codes 400 - 499: Client error responses

These are used to report faults made by the client, like requesting for a non-existent resource or making a bad request, usually accompanied by an explanation about the fault itself and whether it is temporary or permanent.

- `400 Bad Request`: The request is not processed due to a client error like malformed request syntax or invalid request messages.
- `401 Unauthorised`: Slightly misleading, semantically it means that the response is "unauthenticated". The client must add the proper, non-malformed authentication credentials for a resource.
- `403 Forbidden`: Indicates that the server refuses to act on the request due to a broad set of reasons from the user missing necessary permissions to attempts on a forbidden or impossible action. Unlike `401 Unauthorised`, the identity of the client is known to the server.
- `404 Not Found`: The most popular status code, it indicates that a resource does not exist, even if the URL is valid.

#### Status codes 500 - 599: Server error responses

Indicates when the server fails to process a request.

- `500 Internal Server Error`: A generic catch-all status code used to indicate that an internal error faced by the server while processing the request.
- `501 Not Implemented`: The server lacks the capabilities to fulfill the request or is unable to recognise the request method.

### URLs

By now, I'm sure we know what URLs are, but as a quick refresher, let's check one out. It consists of a simple structure of a few components. Take the following as an example.

```text
http://sub.domain.com:1234/path/to/resource?query=something&param=something#anchor
```

- Here, `http` is the protocol. Some others that you might notice includes https, ftp and so on.
- The host name is `subdomain.domain.com`
- The subdomain here is `sub`
- The domain name is `domain.com`
- `1234` indicates the port. The browser usually hides this, since it defaults to `80`, which is the default port for web servers.
- `/path/to/resource` denotes the resource path which refers to a resource location within the server.
- There are some query parameters here: `?query=something&param=something`. Query string parameters start with a question mark (`?`), following a `key=value` format and seperated by an ampersand (`&`). There can be any number of parameters and they are generally used by the server to spot the right resource.
- The `#anchor` is called a fragment or a named anchor. It is used to refer to an internal section within a web document.

### RESTful APIs

Simply put, an API is an interface. When an application needs to interact with another, it sends a request to the respective API. As you've learnt in previous lessons, in the context of the web, any server that is created to serve data for external use is called an API. While you can structure your API in multiple ways, a popular and conventional method to do so is to follow REST (**Re**presentational **S**tate **T**ransfer). [The exact definition of REST](https://en.wikipedia.org/wiki/REST#Principle) might be a little complicated, but for us, it states that there is a set of standards to be followed to make our API, RESTful (adhere to the constraints set by REST).

Since we have already talked about seperating the client and the server, it fufills the first constraint of REST - the two are well defined as the frontend and the backend. Further constraints like stateless-ness and caching are covered by and ensured later with ExpressJS. Our key concern at this point is the organisation of endpoint URIs (Uniform Resource Identifiers) with respect to our resources.

As mentioned, usually your backend application will need to send data to your frontend. The most popular way to do so by far is with JSON, primarily due to the ease of parsing it with JavaScript. So all we need to do is to replace our HTML and serve JSON instead. All that you have to do, thus, is to pass your information to [`res.json()`](https://expressjs.com/en/4x/api.html#res.json) instead of [`res.send()`](https://expressjs.com/en/4x/api.html#res.send) or [`res.render()`](https://expressjs.com/en/4x/api.html#res.render).

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

1. [[Add the tutplus content as a refresher to HTTP stuff, and probably the request/response checker?]]
1. [[Add further details on response codes. What do I cover as "important/common"?]]

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What is CRUD?](https://www.codecademy.com/article/what-is-crud)
- [What are the HTTP methods and where are they used?](#crud-and-http-methods)
- [Which HTTP method does each letter in CRUD (Create, Read, Update, Delete) correspond to?](https://stackoverflow.blog/2020/03/02/best-practices-for-rest-api-design/#h-use-nouns-instead-of-verbs-in-endpoint-paths)
- [What part of an URL is referred to as the query paramters?](#urls)
- [Which HTTP response status code is used to indicate the permanent relocation of a resource?](#status-codes-300---399-redirection-messages)
- [What is an API and how do you make it RESTful](#restful-apis)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
