### Introduction

In the previous lesson, we broke down a basic Express app and a request's journey through it. However, in a real app, we'd want to handle many different types of requests for different things.

Routes essentially just match a request's HTTP verb (e.g. `GET` or `POST`) and URL path to the appropriate set of middleware functions - the controllers. We will explore controllers and middleware in more detail in the next lesson. For now, let's dive into how we can use routes.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Describe how routes are defined.
- Match routes to specific HTTP verbs and paths.
- Explain route parameters and query parameters.
- Extract routes to their own routers.

### The anatomy of a route

Let's return to our sole route in our previous basic Express app.

```javascript
app.get("/", (req, res) => res.send("Hello, world!"));
```

`app.get("/"` tells us that this route will match any requests that go through `app` (our whole server) that have the `GET` HTTP verb and are for the `/` path. If instead we had the following:

```javascript
app.post("/messages", (req, res) => res.send("This is where you can see any messages."));
```

That would tell us the route matches any `POST` requests to the `/messages` path of our `app`. If you sent a `GET` request to the `/messages` path, it would not match this route.

<div class="lesson-note" markdown="1">

#### HTTP verbs

[There are many HTTP verbs](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods), but for now, we will primarily be using `GET` (used to retrieve data from the server only) and `POST` (used to send data to the server e.g. forms). Later, when we cover REST APIs, you will often also encounter `PUT` and `DELETE` verbs.

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
