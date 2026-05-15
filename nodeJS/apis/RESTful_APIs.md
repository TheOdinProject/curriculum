### Introduction

When simply put, an API is an interface. When an application needs to interact with another, it sends a request to the respective API. As you've learned in previous lessons, in the context of the web, any server that is created to serve data for external use is called an API. Until now, you have been creating a server to serve your assets like HTML, CSS, and JavaScript. But you have also learned about React and client-side navigation - here is where we come to understand why.

In the last decade, a specific pattern for developing websites has gained a lot of popularity. Instead of creating an app that hosts both the database and view templates, one can separate these concerns into separate projects, hosting their backend and database on a server (either on something like [Heroku](https://www.heroku.com/) or on a VPS like [Digital Ocean](https://www.digitalocean.com/)), then using a service such as [GitHub Pages](https://pages.github.com/) or [Netlify](https://www.netlify.com/) to host their frontend.

This pattern is sometimes referred to as the [Jamstack](https://jamstack.org/what-is-jamstack/). The most obvious benefit of this is its separation of the business logic and view logic. This allows you to use a singular backend as a source of data for whatever frontend application(s) you want. You can send data to a website, a desktop app, and a mobile app with the same backend. These two separate entities interact with the help of APIs.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Detail the naming conventions for RESTful API endpoints.
- Reinforcing what HTTP methods/verbs and status codes are.
- Understand the different components of a URL.
- Understand what makes an API RESTful.
- Recognising RESTful APIs from examples.

### HTTP

HTTP can be roughly defined as the layer that acts as a protocol for a request-and-response mode of communication between a client (here, browser) and a server. If you open up the network tab in the developer tools of your browser and refresh the page, you will notice a long list of items. These are loosely referred to as "resources" - a thing in the database of your server that the browser is asking for as a request and getting as a response.

Clicking on any of these items reveals further details about them. Notice that each request and response has a header and (usually) a body component. The header contains information about the request/response, like the address to send/receive from, the type of information being transmitted, and more. The body contains the data added to the request/response, like form submissions, authentication tokens for requests, or the page content for responses.

### CRUD and HTTP methods

By now, you have probably heard the term CRUD. Broadly, an API provides four functions on any resource - **c**reating it, **r**eading about it, **u**pdating it, and **d**eleting it. CRUD describes the actions you can perform on a resource. If an action doesn't fit into these four categories, it might mean that it should be treated as a separate resource. A key component of any request is understanding which of these four actions it represents.

Instead of having a naming convention like `/getPosts` or `/setPosts`, a request directly refers to the resource itself (here, `/posts`) and a corresponding HTTP method (colloquially called HTTP verbs, since they are verbs, grammatically). The methods are as follows:

| Method | Action | Example                                         |
| ------ | ------ | ----------------------------------------------- |
| POST   | Create | `POST /posts` - Creates a new blog post         |
| GET    | Read   | `GET /posts/:postid` - Fetches a single post    |
| PUT    | Update | `PUT /posts/:postid` - Updates a single post    |
| DELETE | Delete | `DELETE /posts/:postid` - Deletes a single post |

There are usually 2 URLs for a resource - one for the entire collection and one for a single object in the collection. One can `GET /posts` for all of the posts or `GET /posts/:postid` for one of them. Nesting URLs further is entirely possible: `GET /posts/:postid/comments` can get all the comments for a post, while `GET /posts/:postid/comments/:commentid` can get a specific comment on a specific post.

### HTTP response status codes

Every response from a server has a response code that provides quick and basic context regarding the response itself to the client. They are classified into five classes:

#### Status codes 100 - 199: Informational responses

Introduced by the HTTP/1.1 standard, these indicate that a request was received and understood. They're mostly used on a provisional basis while the request processing continues, alerting the client to wait for a final response.

#### Status codes 200 - 299: Successful responses

These tell the client that a request was successfully received and processed.

- `200 OK`: This is the default to indicate a successful request. The result and response depend on the HTTP method, like sending the resource in the body for a `GET` request or describing the created entity for a `POST` request.
- `202 Accepted`: Indicates that a request was accepted but is being processed. No further context is attached to the response, like whether it will be acted on eventually or not.

#### Status codes 300 - 399: Redirection messages

Whenever an additional action is needed to complete the request, it is indicated to the client with this class of status codes. A major use case for these is URL redirection.

- `301 Moved Permanently`: Denotes the permanent relocation of any resource to a different URL, while adding the new URL to the response.

#### Status codes 400 - 499: Client error responses

These are used to report faults made by the client, like requesting a non-existent resource or making a bad request, usually accompanied by an explanation about the fault itself and whether it is temporary or permanent.

- `400 Bad Request`: The request is not processed due to a client error like malformed request syntax or invalid request messages.
- `401 Unauthorised`: Slightly misleading, semantically it means that the response is "unauthenticated". The client must add the proper, non-malformed authentication credentials for a resource.
- `403 Forbidden`: Indicates that the server refuses to act on the request due to a broad set of reasons from the user missing necessary permissions to attempts on a forbidden or impossible action. Unlike `401 Unauthorised`, the identity of the client is known to the server.
- `404 Not Found`: The most popular status code, indicates that a resource does not exist, even if the URL is valid.

#### Status codes 500 - 599: Server error responses

They indicate when the server fails to process a request.

- `500 Internal Server Error`: A generic catch-all status code used to indicate an internal error faced by the server while processing the request.
- `501 Not Implemented`: The server lacks the capabilities to fulfill the request or is unable to recognize the request method.

### URLs

By now, I'm sure we know what URLs are, but as a quick refresher, let's check one out. It consists of a simple structure of a few components. Take the following as an example.

```text
http://sub.domain.com:1234/path/to/resource?query=something&param=something#anchor
```

- Here, `http` is the protocol. Some others that you might notice include https, ftp, and so on.
- The hostname is `sub.domain.com`
- The subdomain here is `sub`
- The domain name is `domain.com`
- `1234` indicates the port. The browser usually hides this, since it defaults to `80`, which is the default port for web servers.
- `/path/to/resource` denotes the resource path which refers to a resource location within the server.
- There are some query parameters here: `?query=something&param=something`. Query string parameters start with a question mark (`?`), following a pattern of `key=value` pairs, which are separated by ampersands (`&`). There can be any number of parameters, and they are generally used by the server to identify the right resource.
- The `#anchor` is called a fragment or a named anchor. It is used to refer to an internal section within a web document.

### RESTful APIs

While you can structure your API in multiple ways, a popular and conventional method to do so is to follow REST (**Re**presentational **S**tate **T**ransfer). [The exact definition of REST](https://en.wikipedia.org/wiki/REST#Principle) might be a little complicated, but for us, it states that there is a set of standards to be followed to make our API RESTful (adhere to the constraints set by REST).

Earlier, we mentioned separating the client and the server, which fulfills the first constraint of REST: the frontend and backend are well-defined. Further constraints like statelessness and caching are covered by and ensured later with Express. Our key concern at this point is the organization of endpoint URLs with respect to our resources.

As mentioned, usually your backend application will need to send data to your frontend. The most popular way to do so by far is with JSON, primarily due to the ease of parsing it with JavaScript. So all we need to do is to replace our HTML and serve JSON instead. All that you have to do, thus, is to pass your information to [`res.json()`](https://expressjs.com/en/4x/api.html#res.json) instead of [`res.send()`](https://expressjs.com/en/4x/api.html#res.send) or [`res.render()`](https://expressjs.com/en/4x/api.html#res.render).

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Check out the [list of HTTP response status codes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) listed in the MDN documentation. While you will never use some codes, you will notice a lot of useful ones.
1. Read up on REST and RESTful APIs in the following resources.
   - Go through the following [CodeAcademy article discussing REST](https://www.codecademy.com/article/what-is-rest). It discusses the definitions of REST and gives some good examples to explain important keywords.
   - Check out this [StackOverflow article about RESTful API design](https://stackoverflow.blog/2020/03/02/best-practices-for-rest-api-design). If you want to code along, do remember that the `body-parser` middleware mentioned here has been incorporated into the Express package itself since 4.16.x and is no longer necessary.
1. Code along with this tutorial on [setting up a REST API with Express](https://www.robinwieruch.de/node-express-server-rest-api/). Go through this article thoroughly, as it covers key details like organizing your code, dive into middlewares, and provides links to other important resources at the end.

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What is CRUD?](https://www.codecademy.com/article/what-is-crud)
- [What are the four main HTTP methods, and how are they used?](#crud-and-http-methods)
- [Which HTTP method corresponds to each action in CRUD (Create, Read, Update, Delete)?](https://stackoverflow.blog/2020/03/02/best-practices-for-rest-api-design/#h-use-nouns-instead-of-verbs-in-endpoint-paths)
- [Which part of a URL is referred to as query parameters?](#urls)
- [Which HTTP response status code indicates the permanent relocation of a resource?](#status-codes-300-399-redirection-messages)
- [What is an API and how do you make it RESTful?](#restful-apis)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- [HTTP Request/Response Basics](http://justahelp.blogspot.com/2013/09/http-requestresponse-basics.html) from Pralay Roy goes into further detail about their lifecycle and anatomy with best practices.
