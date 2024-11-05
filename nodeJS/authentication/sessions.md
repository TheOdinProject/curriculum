### Introduction

Now that we've been introduced to cookies and their various uses and properties, let's use them to help us implement something. We want to allow someone to log in once and let the server "remember" them, automatically recognising any future requests from them.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Describe what sessions are.
- Explain how sessions and cookies can be used together to persist logins.
- Implement authentication with sessions.
- Use a database as a session store.
- Explain how and why passwords are hashed before being stored.

### Persisting logins

The basic login process (with a username and password) is rather straightforward. The user can submit a form with their username and password, then the server can check the database if that username/password combo exists. If it does, great - it knows who the requester is and can continue with the request as appropriate. If it does not exist, it does not know who the requester is so it can end the request there and then.

But if someone does successfully "log in", how does the server recognise that the next request that user sends is coming from them? Without a system to persist the login, it'd just be a plain ol' request like any other and could have come from anyone. To handle this, we will use **sessions**.

### Sessions

When a user successfully logs in, we can store (serialize) some information about that user, such as their user ID in a database table, somewhere server-side like another database table or some dedicated session store. That session will have its own ID and may also have an expiry time. We can then store that session's ID in a cookie (it doesn't need anything else stored in it) and send it back to the user in the server response. The client now has that cookie with the session ID and can then attach it to any future requests. The server can then check the database for a valid session with the same ID it found in the cookie. If there is a matching session, great - it can extract the serialized user information (deserialize) and continue with the request now it knows who made it. If there is no matching or valid session, like with logging in, we don't know who the user is so we can end the request there.

This is exactly like having a name badge or access pass at work or some event. The cookie is like an access pass which you (the client) give to a machine or security (the server) and it checks who you are and if you're allowed in or not. You can go home and come back the next day, reusing that pass as many times as you need.

### Assignment

<div class="lesson-content__panel" markdown="1">

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [From inside to outside, what is the order of box-model properties?](#the-box-model)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
