### Introduction

Previously, we learned about using sessions to persist logins and authenticate users. Session data would be stored server-side and the client issued their session's ID via a cookie. When authenticating, the session store would be checked for a matching session. This kind of authentication is "stateful".

An alternative approach to authentication, and one that is common with REST APIs, is to use "stateless" authentication with JSON web tokens (JWTs). While many of the overarching auth concepts and processes remain the same, the main difference between using stateful and stateless authentication is where the authentication data is stored: server-side or client-side. In this lesson, you will be introduced to stateless authentication using JWTs.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Describe what JSON web tokens (JWTs) are.
- Describe what stateless authentication is.
- Explain some of the differences between authentication with sessions and JWTs.
- Implement basic stateless authentication with JWTs.
- Describe potential security issues with stateless authentication.

### JWTs

JWTs are tokens that allow us to send information between various clients and servers, or even between servers. Like with session cookies, they are signed which involves hashing the rest of the JWT (including the payload) with a secret known only to the issuing server.

JWTs are often not encrypted, only encoded in base64. You can use any JWT decoder such as [jwt.io](https://jwt.io/), paste a JWT in and see the contents; the important part is the signature. For example, here is an example JWT:

```text
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiT2RpbiJ9.FtLFoA9kG8B_gvKz0nEzx4uDYAlsgWhxTGEUfinYcf8
```

You don't need to understand the inner workings of JWTs but let's peek at what's going on. Paste that into [jwt.io](https://jwt.io/) and you'll see a payload of `{ "name": "Odin" }` along with an "invalid signature" warning. If you change the secret in the "verify signature" box to `theodinproject` then paste the JWT back in, it'll say "signature verified". If you change any part of the JWT contents, such as the payload or secret, you'll see the JWT value change. In particular, the signature section changes *dramatically*.

This is how a server can verify if it did indeed issue an incoming JWT as well as verify if it had been tampered with, as a different payload would generate a different signature, even with the same secret. Unless you also know the secret, you would not be able to create the correct signature for the changed payload.

### Stateless authentication

We can use JWTs to authenticate our APIs in a stateless manner, that is the server side does not need to store any of the authentication data itself. It only needs to store a secret so it can generate tokens signed with that secret and send them to the client. Then for incoming requests, it needs only verify that it made the incoming JWT and it has not been tampered with, and can deserialize the payload if verified. Else, it can unauthorize the request. All this occurs without needing to make a database call to grab the authentication data (like with sessions, a stateful solution). Neat, no?

This is not all sunshine and roses, however. There are always tradeoffs, especially when security is concerned, and we will discuss these in more detail in a later lesson where we compare stateful authentication with sessions and stateless authentication with JWTs. Nonetheless, you're likely to encounter this sort of authentication at some point out in the wild, so it's good to get some experience with the concept (even if a basic implementation).

### Generating JWTs

Back in the Sessions lesson, when a user successfully logged in, their ID was serialised to a session which was saved to the database, and a cookie sent back to the client with the signed session ID. With JWTs, a very similar process occurs, just a JWT is created and sent instead, and nothing gets saved to the database. You can generate JWTs using the [jsonwebtoken](https://www.npmjs.com/package/jsonwebtoken) library. For example, in a login route middleware:

```javascript
// importing the jsonwebtoken library somewhere appropriate
const jwt = require("jsonwebtoken");

// somewhere in a login route middleware
if (user?.password === req.body.password) {
  const token = jwt.sign({
    id: user.id
  }, process.env.SECRET, { expiresIn: "1d" });

  res.set({Authorization: `Bearer ${token}`}).json("Login successful");
} else {
  res.status(401).json("Incorrect username or password");
}
```

There are many ways JWTs can be sent to and from servers, such as in the response's "Authorization" header via the [Bearer scheme](https://security.stackexchange.com/questions/108662) or via httpOnly cookies. Since we have not yet covered how to handle cross-site cookies, the example above sends the JWT as a bearer token in the response's Authorization header.

<div class="lesson-note lesson-note--critical" markdown="1">

#### JWT payloads and sensitive data

Remember that JWTs are sent to and stored on the client. If a malicious party is able to access the token at any point, they can read its contents. While you should not need to do so anyway, **do not store sensitive data in a JWT.**

</div>

### Verifying JWTs

So when a user successfully logs in, the server generates and sends a signed JWT in response. What about for incoming requests to routes we want to protect?

The client must attach the JWT to any such requests, whether that's through `fetch` in a script or when using something like Postman. In our case, we'll do the same as earlier and write to the "Authorization" header using the format `Bearer: <JWT>`. Just like with the Sessions lesson, any routes we want to protect will need a middleware to authenticate the request first. However, instead of doing session stuff like before, we need to extract the JWT and verify its signature. For example:

```javascript
// in an authentication middleware
const token = req.get("authorization")?.split(" ")[1];
try {
  req.user = jwt.verify(token, process.env.SECRET);
  next();
} catch (err) {
  res.status(401).json("Could not authenticate user");
}
```

Upon successful verification, the payload is returned and can be handled however necessary; in the example above, it gets attached to `req` and the next middleware is called. If the token is not valid, whether that's from it having expired or not valid or even non-existant, an error is thrown which we can catch and unauthorize the request, responding to the client with a 401 since we do not know who they are.

### Assignment

<div class="lesson-content__panel" markdown="1">

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [A KNOWLEDGE CHECK QUESTION](A-KNOWLEDGE-CHECK-URL)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
