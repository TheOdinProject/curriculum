### Introduction

In previous lessons, we covered both stateful authentication (demonstrated using server-side sessions) and stateless authentication (using JWTs) for the purpose of session management (persisting logins). You will often see both approaches out in the wild, although not necessarily implemented using sessions or JWTs specifically, but still, why the options? What are the pros and cons of each? How should you authenticate your applications?

In this lesson, we will explore and compare our options specifically in the context of projects for the rest of this course, where authentication is used for session management. We will also touch on challenges you may face when it comes to authentication and deployment.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Comparison of stateful and stateless approaches to authentication and session management.
- Approaches to authentication when hosting on different domains.

### Stateful vs stateless

Stateful authentication involves authentication data being stored server-side, such as in a session, while stateless authentication stores the data client-side, such as in a JWT. Why might one pick a stateless solution over a stateful one or vice versa?

Stateless solutions reduce the number of database calls needed per authenticated request, as a call is not needed to check the database for a matching session - the data is already there in the request and needs only to be verified. But is this actually a problem? At what point does this additional database call become a performance bottleneck in a stateful solution? While much larger products built with more complex architectures may well need to consider this, in all honesty, this is almost certainly not going to be an issue for many small projects, certainly not curriculum projects (and if it genuinely does become an issue, congratulations on the successful site!).

But is there actually a negative to using something like JWTs for stateless authentication? Yes, particularly when it comes to **authorization** and **invalidation**.

#### Authentication and authorization

Back in the JWT lesson, we demonstrated authenticating a request by verifying the JWT and then using the ID from the payload to query the database for user data. This was intentional in order to avoid using the JWT for authorization; that is, the JWT only told us who was making the request but did not contain any personal information or things like roles and permissions.

Imagine if Odin was demoted from "god" to "demigod", meaning he's no longer allowed to access the god-only section of Valhalla. If the JWT stored role information, that information is now **stale**, yet it still exists. As long as Odin still has that JWT, he could fool anyone into thinking he was still a full-blown god and not a demigod! Ideally the database holds the source of truth for these things, and we query it only once we have verified who is making the request. While this can still occur when using sessions (i.e. storing permissions in the sessions themselves), at the very least session data is not stored client-side for anyone to see or take for themselves. This also leads us straight into the next issue to address.

#### Invalidation

How do you invalidate a session, such as when a user logs out? You just delete the session from the database, then no matter who has the old session ID, there won't be a matching session, so it's now invalid. Now, how do you invalidate something like a JWT? As per the JWT lesson, you'd delete the JWT from the client. But does that actually mean the JWT is no longer valid?

JWTs are much harder to invalidate. Say you generate one with a 2-day expiry, then the client logs out, deleting it from whatever storage medium was used. The client no longer has the token, but since it's just text, anyone else who has that text could continue to use it and it would still be valid until expiry. The token could have been obtained via any number of malicious attack methods, including [cross-site scripting (XSS)](https://en.wikipedia.org/wiki/Cross-site_scripting) and [cross-site request forgery (CSRF)](https://en.wikipedia.org/wiki/Cross-site_request_forgery), especially if the token was stored somewhere like in local storage. At the most basic level, a pesky sibling/roommate could have gone on your computer, opened devtools, and then copied down the JWT value to use on their machine.

The same applies to now-demigod Odin. His father, Borr, took away his "My name is Odin, and I'm a god" token but luckily, Loki had a copy for him, so now Odin can go around pretending to be a full-blown god again. Even worse, Loki could go around pretending to be Odin himself!

Since the server does not store the tokens, it cannot directly invalidate them without changing the secret used to sign them, but then that will invalidate *every* user's tokens. Keeping a server-side list of revoked tokens would just make things stateful (like a more complex version of sessions), since every authenticated request must query that revocation list before verifying any tokens. Setting a super-short expiry time like a few minutes would definitely reduce how long a malicious actor could use a stolen JWT to wreak havoc, but then that'd ruin the user experience for everyone else if they could only stay logged in for a few minutes at a time (though this can be a desirable security feature, like with many banking websites).

#### A hybrid approach

As a result, some services implement a hybrid stateful/stateless approach, such as using two tokens: "access" and "refresh". The main JWT is the "access token" and has a very short expiry. The client also receives a second "refresh token" with a much longer expiry, and *that* token is stored server-side (making it the stateful part). If the access token is still valid, it's used as normal. If it has expired, the server checks if the refresh token is valid. If it is, the server can generate a fresh access token for use, but if not, it can unauthorize the request.

This comes with the benefit of not needing the additional database call for authentication data for any requests made with a valid access token, and the long-expiry refresh token retains the longer login persistence for a better user experience. Since the refresh tokens can be invalidated by deleting them from the database, the short-expiry access token reduces the duration of potential vulnerability.

### Authentication and TOP projects

For the purposes of TOP projects going forward, stick to stateful authentication using sessions. None of this means stateless authentication or JWTs are inherently bad, only that for the purposes of projects in this curriculum, it's not really worth the additional complexity trying to implement and ensure the security of a stateless solution when you can use a stateful one instead. "Scaling" is only relevant in context, and curriculum projects or even many small personal projects are seldom going to get to the point where stateful solutions will be a genuine performance bottleneck that requires a stateless solution instead.

There are plenty of good and bad implementations of authentication out in the wild, both stateful and stateless; hence, it's good to be aware of the concepts and mechanisms. You may end up working with things in the future where stateless authentication (whether with JWTs or other types of tokens) makes perfect sense. As far as TOP projects are concerned though, that isn't quite the case; simply put, our use case for authenticating requests from an SPA and separate server is one where stateful sessions are a very appropriate solution, more so than stateless JWTs.

### Cross-site authentication

Given that we're recommending sticking with stateful sessions and the use of httpOnly cookies to send and store the session ID, there's a little more we have to do now that we're starting to make single-page applications (SPAs) and hosting them separately from our servers.

Earlier in the course, we made monolithic applications; the servers we made were also the ones serving the front end, meaning both ends would have been on the same domain when deployed. Any requests between client and server would have been "first party" (or "same site"). Browsers are very happy to set first-party cookies.

The problem comes when each end is hosted on separate domains, where requests are "third party" (or "cross site"). Nowadays, browsers are not very happy to set third-party cookies, and you may have already heard about [restrictions on third-party cookies across browsers](https://developer.mozilla.org/en-US/docs/Web/Privacy/Guides/Third-party_cookies#how_do_browsers_handle_third-party_cookies) over the last few years. This will pose a problem with our third-party session cookies! We'd send them from the server, but the client won't set them, meaning no login persistence!

We *could* handle this by purchasing a custom domain and setting things up so our separate client and server are both on that domain, meaning our session cookies would be first-party cookies, but that's out of the scope of this curriculum. So what can we do instead?

#### Reverse proxies

A reverse proxy is a server that takes requests from a client and then forwards that request to another server, like a middleman. This versatile thing is one option for our third-party session cookie dilemma and the simplest to implement in terms of this curriculum's scope.

The idea is that instead of sending requests directly to the main server, the client sends a request to the reverse proxy, which would be hosted on the same domain as the client. The reverse proxy would then forward that request to our main server. Our main server would then respond to the reverse proxy, which would then forward the response back to the client. The important thing here is that the reverse proxy and client are hosted on the same domain, which would mean, as far as the client is concerned, everything is first party, not third party. This includes any cookies, and we know browsers are very happy setting first-party cookies.

Fortunately for us, at the time of writing, both Netlify and Vercel allow us to set up reverse proxies on the same domain as the client without much work (unfortunately Cloudflare Pages does not support proxying to a different domain). Remember how with SPAs hosted on Netlify or Vercel, you'd need a "rewrite rule" to ensure all routes would still work if you refreshed the page or accessed them directly via the address bar? For example, Netlify would have required a `_redirects` file containing something like:

```text
/* /index.html 200
```

This would tell Netlify to "serve `index.html` for any route (not just `/`)", then React Router would take over as necessary once loaded. We can do something very similar to set up a reverse proxy. For example, using the same Netlify `_redirects` format, we can add another rewrite rule:

```text
/api/* https://super-awesome-main-server-wow.com/:splat  200
```

This would redirect any requests for a client-side endpoint beginning with `/api` (just an example - can be anything you want) to the equivalent endpoint on `https://super-awesome-main-server-wow.com`.

So if your front end is hosted on `https://super-awesome-client-wow.netlify.app`. Instead of POSTing directly to `https://super-awesome-main-server-wow.com/sessions`, you would POST to `https://super-awesome-client-wow.netlify.app/api/sessions`. Since Netlify and Vercel both support reverse proxying to another domain, they would forward that request to `https://super-awesome-main-server-wow.com/sessions`. You would also need to [make sure your Express server can trust reverse proxies](https://expressjs.com/en/guide/behind-proxies.html) by adding something like this to your server setup:

```javascript
// somewhere early in app.js
app.set('trust proxy', 1);
```

In most cases, a value of 1 should suffice, though it's entirely possible that, depending on where your server is hosted, a larger number is needed. Together, you can ensure a simpler and more secure stateful solution for session management while still having your client hosted on Netlify or Vercel and your server hosted separately on one of the [PaaS options from the Deployment lesson](https://www.theodinproject.com/lessons/node-path-nodejs-deployment#our-recommended-paas-services).

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read about [avoiding JWTs to implement browser sessions](https://ianlondon.github.io/posts/dont-use-jwts-for-sessions/).
1. Check out [Netlify's docs for proxying to another service](https://docs.netlify.com/manage/routing/redirects/rewrites-proxies/#proxy-to-another-service) as well as [Vercel's docs for proxying to another service](https://vercel.com/docs/rewrites#external-rewrites).

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Why might a product want to use stateless authentication instead of stateful?](#stateful-vs-stateless)
- [What issues might one face with stale data in authentication tokens?](#authentication-and-authorization)
- [What issues might stateless authentication have regarding invalidation?](#invalidation)
- [What issue can we face with session cookies when our client and server are hosted on separate domains?](#cross-site-authentication)
- [What is one way we can solve our third-party session cookie dilemma?](#reverse-proxies)
