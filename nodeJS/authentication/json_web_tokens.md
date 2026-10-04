### Introduction

Previously, we learned about using sessions to persist logins and authenticate users. Session data would be stored server-side and the client issued their session's ID via a cookie. When authenticating, the session store would be checked for a matching session. This kind of authentication is "stateful".

An alternative approach to authentication, and one that is common with REST APIs, is to use "stateless" authentication with JSON web tokens (JWTs). While many of the overarching auth concepts and processes remain the same, the main difference between using stateful and stateless authentication is where the authentication data is stored: server-side or client-side. In this lesson, you will be introduced to stateless authentication using JWTs.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Cross-Origin Resource Sharing (CORS).
- JSON web tokens (JWTs).
- Stateless authentication.
- Differences between authentication with sessions and JWTs.
- Implementing basic stateless authentication with JWTs.

### CORS

Before we dive into JWTs, we need to address a "little" thing called Cross-Origin Resource Sharing (CORS). In this lesson, since it's a very common use case for stateless authentication with JWTs, we'll look at all of this from the perspective of a site fetching from a REST API hosted on a separate domain. This means that any requests and responses between client and server will be "cross-origin" (e.g. from `foo.com` to `bar.com`, or `localhost:5173` to `localhost:3000`).

For security reasons, by default, browsers block access to certain cross-origin resources via the [Same-Origin Policy (SOP)](https://developer.mozilla.org/en-US/docs/Web/Security/Defenses/Same-origin_policy), such as when requests are made with `fetch()`. For example, if `localhost:5173` tries to `fetch` from `localhost:3000`, by default you'd get a big fat error about cross-origin requests being blocked.

Of course, sometimes we do want and need to make cross-origin requests; this is where CORS comes in. CORS is what lets us relax the SOP in order to allow access to certain cross-origin resources by letting us do things such as (but not limited to) whitelisting particular origins or allowing access to specific headers that would otherwise have been blocked, or even specifying certain HTTP verbs that'd be allowed. By setting the right headers on the server, CORS will unblock access to the requests we want to make (while anything else will remain blocked).

Note that all of this is specifically a browser security thing. Cross-origin requests from other types of clients (like cURL, Postman, or even another server) are not subject to the SOP and so CORS would not be relevant then.

#### Setting CORS headers

Going forward, you're going to be making applications with separate front and back ends, which will be served on separate domains (just like how you'll have made the Weather App and Shopping Cart projects, only you'll be making the server stuff yourself too). The examples in this lesson will be within that context (we won't be walking you through any full app setup, just discussing the things related to stateless authentication and JWTs).

The most straightforward way to set the necessary CORS headers on your server is to use the [`cors` npm package](https://www.npmjs.com/package/cors), which provides an Express middleware that we can configure with certain options. For example, if for our entire app we wanted to whitelist only `localhost` on port 5173, allow the sending of `User-Agent` and `Authorization` headers but only if the request is a `GET`, `POST` or `DELETE`, we could set something like this:

```javascript
const cors = require("cors");

// somewhere before routes are defined
app.use(cors({
  origin: "http://localhost:5173",
  allowedHeaders: ["User-Agent", "Authorization"],
  methods: ["GET", "POST", "DELETE"],
}));
```

Ultimately, you'd configure whatever you need, so check out the docs for the package. Your needs will likely be very simple at first, but of course in the future, you may run into more situations that require further CORS configuration.

Now with that out of the way, let's discuss JWTs.

### JWTs

JWTs are tokens that allow us to send information between various clients and servers, or even between servers. Like with session cookies, they are signed, which involves hashing the rest of the JWT (including the payload) with a secret known only to the issuing server.

JWTs are often not encrypted, only encoded in base64. You can use any JWT decoder, such as [jwt.io](https://jwt.io/), paste a JWT in, and see the contents; the important part is the signature. For example, here is a sample JWT:

```text
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiT2RpbiJ9.FtLFoA9kG8B_gvKz0nEzx4uDYAlsgWhxTGEUfinYcf8
```

You don't need to understand the inner workings of JWTs, but let's peek at what's going on. Paste that into [jwt.io](https://jwt.io/) and you'll see a payload of `{ "name": "Odin" }` along with an "invalid signature" warning. Change the secret in the "verify signature" box to `theodinproject` and you'll see it now says "signature verified". Now switch to the JWT Encoder tab, then try changing any part of the JWT contents, such as the payload or secret. You'll see the JWT value change. In particular, the signature section changes *dramatically*.

This is how a server can verify if it did indeed issue an incoming JWT as well as verify if it had been tampered with, as a different payload would generate a different signature, even with the same secret. Unless you also know the secret, you would not be able to create the correct signature for the changed payload.

### Stateless authentication

We can use JWTs to authenticate our APIs in a stateless manner; the server does not need to store any of the authentication data itself. It only needs to store a secret so it can generate tokens signed with that secret and send them to the client. Then, for incoming requests, it needs only verify that it made the incoming JWT and it has not been tampered with and can deserialize the payload if verified. Else, it can unauthorize the request. All this occurs without needing to make a database call to grab the authentication data (unlike sessions, a stateful solution). Neat, no?

This is not all sunshine and roses, however. There are always tradeoffs, especially when security is concerned, and we will discuss these in more detail in a later lesson where we compare stateful authentication with sessions and stateless authentication with JWTs. Nonetheless, you're likely to encounter this sort of authentication at some point out in the wild, so it's good to get some experience with the concept (even if it's a basic implementation).

### Generating JWTs

Back in the Sessions lesson, when a user successfully logged in, their ID was serialized to a session which was saved to the database, and a cookie sent back to the client with the signed session ID. With JWTs, a very similar process occurs, only a JWT is created and sent instead, and nothing gets saved to the database. You can generate JWTs using the [jsonwebtoken](https://www.npmjs.com/package/jsonwebtoken) library. For example, in a login route middleware:

```javascript
// importing the jsonwebtoken library somewhere appropriate
const jwt = require("jsonwebtoken");

// somewhere in a login route middleware
if (user?.password === req.body.password) {
  const token = jwt.sign(
    { id: user.id },
    process.env.SECRET,
    { expiresIn: "1d" },
  );

  res.json({ token });
} else {
  res.status(401).json("Incorrect username or password");
}
```

There are many ways JWTs can be sent to and from servers, such as in a request or response's headers or body, or via httpOnly cookies. Since we have not yet covered how to handle cookies when the client and server are deployed on different domains, the example above sends the JWT back to the client via the response body. Once received by the client, it can be extracted and stored somewhere like local storage (if we sent it in a cookie, it'd just live on the client in that cookie).

<div class="lesson-note lesson-note--critical" markdown="1">

#### JWT payloads and sensitive data

Remember that JWTs are sent to and stored on the client. If a malicious party is able to access the token at any point, they can read its contents. While you should not need to do so anyway, **do not store sensitive data in a JWT.**

</div>

### Verifying JWTs

So when a user successfully logs in, the server generates and sends a signed JWT in response. What about for incoming requests to routes we want to protect?

The client must attach the JWT to any such requests, whether that's through `fetch` in a script or when using something like Postman. Since we are not using cookies for transport, another alternative as per the [JWT specification RFC 7523](https://www.rfc-editor.org/info/rfc7523/) is to send it as a [Bearer token](https://security.stackexchange.com/questions/108662/why-is-bearer-required-before-the-token-in-authorization-header-in-a-http-re) in the request's `Authorization` header using the format `Bearer <JWT>` (this is only necessary for sending requests to a server, not for server responses). For example:

```javascript
// somewhere in a client-side script
const response = await fetch(apiUrl, {
  headers: {
    "Authorization": `Bearer ${token}`,
  },
});

// rest of script...
```

On the server side, just like with the Sessions lesson, any routes we want to protect will need a middleware to authenticate the request first. However, instead of saving a session to a server-side store, we only need to extract the JWT and verify its signature, which can also be done with the `jsonwebtoken` library. For example:

```javascript
// in an authentication middleware
const token = req.get("Authorization")?.split(" ")[1];
try {
  const { id } = jwt.verify(token, process.env.SECRET);
  const { rows } = await pool.query(
    "SELECT * FROM users WHERE id = $1",
    [id],
  );
  const user = rows[0];
  req.user = {
    // whatever user details may be needed for any requests
  }
  next();
} catch (err) {
  res.status(401).json("Could not authenticate user");
}
```

Upon successful verification, the payload is returned and can be handled however necessary; in the example above, we query our database for the right user details, assign what we need to `req.user`, then the next middleware is called. If the token is not valid, whether that's from it having expired or not valid or even non-existent, or if the user no longer exists, an error is thrown which we can then catch and unauthorize the request, responding to the client with a 401 since we do not know who they are. The authentication and database query can also be handled in separate middleware functions if you wish.

Essentially, this is a similar process to our previous session-based authentication system, only since the authentication data came with the JWT payload, we did not need to make an additional database call to grab that data from a session.

### Logging out with JWTs

When we were using sessions, we logged users out by destroying the session itself. You could delete the session cookie at the same time but the main thing is that the session no longer exists. But since we're using JWTs with stateless authentication, the server doesn't store any of this authentication data. Therefore, the only way we can "log out" a user would be to get rid of the JWT on the client, whether that's having the client delete the JWT from local storage or unsetting a cookie if cookies are used etc.

This change of mechanism does come with some caveats but they will be discussed in more detail in a later lesson. For now, it's more important to get an idea for how stateless authentication and JWTs work as a whole.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. It can get quite in depth so no need to dive too deep, but do skim the [MDN docs for CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/CORS#the_http_response_headers) for a little more info than we touched on so far.
1. Read through [Postman's article "What is JWT?"](https://blog.postman.com/what-is-jwt/) for a little more on JWTs themselves.

</div>
