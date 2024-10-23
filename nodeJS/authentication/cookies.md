### Introduction

Before we dive into how to authenticate, let's first have a brief look at cookies, which are really just storage spaces for data that we can send back and forth between a client and a server.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Describe what cookies are.
- Describe what you can use cookies for.
- Explain some of the different attributes of cookies.

### Cookies

Cookies are just little storage spaces for text. They can be used to store a whole variety of things, including (but not limited to) website choices/preferences, shopping cart info, user statistics, or data that allows you to stay logged in even when you refresh or close the browser.

A server can create a cookie and send it along with its response to the client, where the client can then set that cookie. The client may then read that cookie to use that data and/or hold that cookie and attach it to any future requests to the server for it to use.

### Cookie attributes

When creating cookies, various optional [cookie attributes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Set-Cookie#attributes) can be set to customize them, such as preventing them from being accessible via JavaScript in the client, or setting an expiry date etc. There are many such attributes that you can look at in your own time but for now, let's go over some of the most relevant ones for this curriculum.

#### Expires/MaxAge

By default, cookies expire when the client shuts down (whether that's from fully leaving the website or closing the browser). Sometimes, this may be perfectly fine. In other cases, such as a cookie used for keeping you logged in, you want the cookie to stay valid even after leaving or closing the browser.

Persistent cookies need to be given either an expiry date or a maximum age (if you give both then the maximum age is used and the expiry date is ignored). They will remain valid until expiry, after which they cannot be used.

#### HttpOnly

By default, cookies can be accessed via JavaScript in the browser via `document.cookie`. Again, this may be necessary in some cases but in others, this can be incredibly unsafe.

Imagine a cookie used to keep you logged in even for when you leave and revisit a website. Now imagine you're the poor victim of a cross-site scripting (XSS) attack. All the attacker needs to do is access `document.cookie` in the malicious script and retrieve the cookie data. Now they can use that cookie data to pose as you and log into your account on their machine, even if they don't know your username or password!

HttpOnly cookies will still be attached to requests sent with JavaScript on the client (e.g. `fetch()`) and you will still be able to see the cookie details in browser devtools, but they will not be accessible via client-side JavaScript like `document.cookie`, protecting against XSS atacks.

#### Secure

If set, prevents the cookie from being sent with a request/response if not using HTTPS (localhost, which uses HTTP, is the only exception) which ensures the cookie won't be sent via unencrypted and insecure means.

#### SameSite

Determines whether or not the cookie is sent when dealing with cross-site requests in various contexts. We will not dive into this option too much for now, as we will be using cookies in a same-site context first. Later on when we start building REST APIs and separating our server from the client, this attribute and some others will become more relevant.

### Assignment

<div class="lesson-content__panel" markdown="1">

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [A KNOWLEDGE CHECK QUESTION](A-KNOWLEDGE-CHECK-URL)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
