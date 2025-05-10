### Introduction

Previously, we learned about using sessions to persist logins and authenticate users. Session data would be stored server-side and the client issued their session's ID via a cookie. When authenticating, the session store would be checked for a matching session. This kind of authentication is "stateful".

An alternative approach to authentication, and one that is common with REST APIs, is to use "stateless" authentication with JSON web tokens (JWTs). The main difference between using stateful and stateless authentication is where the authentication data is stored: client-side or server-side. In this lesson, you will be introduced to stateless authentication using JWTs.

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

#### Setup

Like with the Sessions lesson, make a new database within `psql` with a `users` table:

```sql
CREATE TABLE users (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  username VARCHAR ( 255 ),
  password VARCHAR ( 255 )
);
```

Again, we will make a very minimal Express app. Since we've just been learning about REST APIs, we won't be using EJS views but responding with JSON from our endpoints. Since we won't be making a website for this, you should [download Postman](https://www.postman.com/downloads/) and use that to send requests to the API.

```bash
npm install express dotenv pg jsonwebtoken
```

```javascript
// app.js
require("dotenv").config();
const { Pool } = require("pg");
const express = require("express");

const pool = new Pool({
  // add your db configuration
});

const app = express();

app.use(express.urlencoded({ extended: false }));

app.get("/me", (req, res) => {
  res.status(401).json("You are not logged in!");
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`App listening on port ${PORT}!`);
});
```

Since we're going to use stateless authentication, the server does not need to store the authentication data itself and so our setup code is a little simpler this time round. Run your server with `node app.js` and test it works by using Postman to send a GET request to `/me` at the appropriate localhost port, e.g. `http://localhost:3000/me`. You should get back a 401 with the string `"You are not logged in!"`.

### Assignment

<div class="lesson-content__panel" markdown="1">

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [A KNOWLEDGE CHECK QUESTION](A-KNOWLEDGE-CHECK-URL)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
