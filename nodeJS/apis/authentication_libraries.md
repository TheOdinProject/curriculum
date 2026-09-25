### Introduction

By this point, you've managed to build authentication a few times. In the Members Only project you handled sign-ups, logins, logouts, and a little bit more, and then again in the Blog API you did it slightly differently, with your front end and back end being separated.

In this lesson, we will address all of the *other things* that authentication involves once real users are relying on it. The projects ahead of you leave it up to you how you want to handle auth, so lets finally cover authentication libraries and how they can be useful, so you can decide whether you want to use them or not.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Why you might want to use an authentication library.
- What Passport and Better Auth provide, and how their approaches differ.

### Rolling your own auth

First of, what does "rolling your own auth" even mean? Well, it's basically what you've done so far. It's not like you had to write a hashing algorithm or invent a session format yourself - you'll have used `argon2` to hash passwords, `express-session` to manage sessions, or `jsonwebtoken` to sign and verify JWTs. Rolling your own auth just meant connecting various authentication tools into a login system.

However, there's a whole lot more to authentication, especially when you consider apps people might use everyday. In many of them, you can reset a forgotten password, or verify your email address. You can also turn on two-factor authentication. We haven't asked you to build any of those things.

As you might guess, if you were to build them yourself, any of those systems is a chance to get security wrong. On the other hand, almost all well established authentication libraries have already had all of the edge cases found and fixed.

### Signing in with other services

Besides being well tested security-wise, authentication libraries can be really useful in handling multiple auth providers.

As an example, lots of sites let you sign in with Google, GitHub, or some other service, instead of having to create another password. This is usually built on [OAuth 2.0](https://oauth.net/2/), a protocol that lets a user grant your application limited access to their account elsewhere, so that service can guarantee who they are. Their password is never yours to handle, which is a nice problem to not have.

If you wanted to implement this yourself, you would need to learn how to the protocol works and then integrate each provider you want to support. But what happens when somebody signs up with a password at some point, then comes back later and signs in with Google using the same email address? Is that one account or two? If it's one, how do we link them together?

Using an authentication library gives us a single API we can use for all of the authentication methods, and makes this whole process a whole lot smoother.

### Authentication libraries

We are going to briefly cover two libraries (though these are by no means the only ones) for handling authentication in Node.js: Passport and Better Auth.

#### Passport

[Passport](https://www.passportjs.org/) is a middleware for Node.js and has been the go-to option in the Express ecosystem for a long time, so you're fairly likely to run into it in existing codebases. It's built around *strategies*, which are separate packages, once per authentication mechanism. For example, [`passport-local`](https://www.passportjs.org/packages/passport-local/) is a strategy for username and password, [`passport-jwt`](https://www.passportjs.org/packages/passport-jwt/) for JWT authentication, [`passport-github2`](https://www.passportjs.org/packages/passport-github2/) for signing in with GitHub, and there are many many others.

In many ways, Passport is minimalistic, flexible and modular - it authenticates a request and then gives you back control. You still need to build things like session handling, password storage, database schema, etc.

#### Better Auth

[Better Auth](https://www.better-auth.com/) does things differently compared to Passport. It's a universal authentication and authorization framework where users, sessions, providers, their database tables, all are part of the framework. Email and password sign-in, social providers, two-factor authentication, account linking etc. - with Better Auth, these we enable in a configuration object, and we don't have to build them ourselves!

This means that it makes the whole process of setting up authentication a lot more abstract, which isn't that great for learning purposes. But if you want to get authentication up and running quickly, Better Auth can be very convenient.

### Conclusion

What you decide to use in upcoming projects is up to you. Whether you decide to keep rolling your own auth, or use something like Passport or Better Auth, the important thing is for you to understand the pros and cons of each approach. For learning purposes, doing everything yourself was very important in understanding how authentication works, even if in real world projects you might want to use a library for convenience and security it provides.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read Passport's [authentication concepts overview](https://www.passportjs.org/concepts/authentication/), then the page on [strategies](https://www.passportjs.org/concepts/authentication/strategies/).
1. Passport's official documentation can be somewhat lacking. Although it hasn't been updated for a while, [Passport: The Hidden Manual](https://github.com/jwalton/passport-api-docs) is a handy thing if you want to better understand some aspects of *how* Passport works.
1. Skim Better Auth's [Express integration guide](https://www.better-auth.com/docs/integrations/express) to see how it gets used in an Express app.

   <div class="lesson-note" markdown="1">

   #### Better Auth ESM and TypeScript

   Better Auth is ESM only, but by leaving the `type` field out of `package.json`, Node will use automatic module resolution, allowing you to use both ESM (where Better Auth needs it) and CommonJS in other parts of our project. Its docs are also written entirely in TypeScript, so you'll have to translate the examples to JavaScript as we go.

   </div>

1. Read Better Auth's [OAuth documentation](https://www.better-auth.com/docs/concepts/oauth) to see what adding multiple sign-in providers looks like in practice.

</div>
