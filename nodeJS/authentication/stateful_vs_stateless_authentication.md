### Introduction

In previous lessons we covered both stateful authentication (demonstrated using sessions) and stateless authentication (using JWTs). You will often see both approaches out in the wild, which may not necessarily be implemented with sessions or JWTs specifically, but why the options? What are the pros and cons of each? How should I authenticate my applications? We will explore and compare our options in this lesson specifically in the context of projects for the rest of this course, where we implement authentication for the purpose of login persistence (session management).

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Compare pros and cons of stateful and stateless approaches to authentication.

### Stateful vs stateless

Stateful authentication involves authentication data being stored server-side, such as in a session, while stateless authentication stores the data client-side, such as in a JWT. Why might one pick a stateless solution over a stateful one or vice versa, especially when you'll find many JWT tutorials online and various contrasting opinions across online forums?

Stateless solutions reduce the amount of database calls needed per authenticated request, as a call is not needed to check the database for a matching session - the data is already there in the request and need only be verified. But is this actually a problem? At what point does this additional database call become a performance bottleneck in a stateful solution? While much larger products built with more complex architectures may well need to consider this, in all honesty, this is almost certainly not going to be an issue for many small projects, certainly not curriculum projects (and if it genuinely does, congratulations on the successful site!).

But is there actually a negative to using something like JWTs for stateless authentication? Potentially: **authorization** and **invalidation**.

### Authentication and authorization

Back in the JWT lesson, we demonstrated authenticating a request by verifying the JWT then using the ID from the payload to query the database for user data. This was intentional in order to avoid using the JWT for authorization, that is, the JWT only told us who was making the request but did not contain any personal information or things like roles and permissions.

Imagine if Odin was demoted from "god" to "demigod". meaning he's no longer allowed to access the god-only section of Valhalla. If the JWT stored role information, that information is now **stale** yet it still exists. As long as Odin (or anyone) still has that JWT, they could fool anyone into thinking they were still a god and not a demigod! Ideally the database holds the source of truth for these things, and we query it only once we have verified who is making the request. While this is still a possibility when using sessions (e.g. storing permissions in the sessions themselves), at the very least session data is not stored client-side for anyone to see or take for themselves. This leads us straight into the next issue to address.

### Invalidation

How do you invalidate a session, such as when a user logs out? You just delete the session from the database. Now no matter who has the old session ID, there won't be a matching session and so it's now invalid. Now how do you do it with something like a JWT? As per the JWT lesson, you'd delete the JWT from the client. But does that actually mean the JWT is no longer valid?

JWTs are much harder to invalidate. Say you generate one with a 2-day expiry and the client then logs out, deleting it from whatever storage medium was used. The client no longer has the token but since it's just text, anyone else who has that text could continue to use it and it will still be valid until expiry. This could have been obtained via any number of malicious attack methods, including [cross-site scripting (XSS)](https://en.wikipedia.org/wiki/Cross-site_scripting) and [cross-site request forgery (CSRF)](https://en.wikipedia.org/wiki/Cross-site_request_forgery), especially if the token is stored somewhere like in local storage. At the most basic level, a pesky sibling/roommate could have gone on your computer, opened devtools, then copied down the JWT value to use on their machine.

The same applies to now-demigod Odin. His father Borr took away his "My name is Odin and I'm a god" token but luckily his son, Loki, had a copy. So now Odin can go around pretending to be a full-blown god again. Even worse, Loki could go around pretending to be his father!

Since the server does not store the tokens, it cannot directly invalidate them without changing the secret used to sign them, but then that will invalidate *every* users' tokens. Keeping a server-side list of revoked tokens would just make things stateful (like a more complex version of sessions), since every authenticated request must query that revocation list before verifying any tokens. Setting a super-short expiry time like a few minutes would definitely reduce how long a malicious actor could use a stolen JWT to wreak havoc, but then that'd ruin the user experience for everyone else if they could only stay logged in for a few minutes at a time (though this is of course sometimes an desirable security feature, like with many banking websites).

#### A hybrid approach

As a result, some services implement a hybrid stateful+stateless approach, such as using two tokens: "access" and "refresh". The main JWT is the "access token" and has a very short expiry. The client also receives a second "refresh token", and *that* token is stored server-side (making it the stateful part). If the access token is still valid, it's used as normal. If it has expired, the server checks if the refresh token is valid. If it is, the server can generate a fresh access token for use, but if not, it can unauthorize the request.

This comes with the benefit of not needing the additional database call for authentication data for any requests made with a valid access token, while retaining the ability to invalidate refresh tokens by deleting them from the database. The short-expiry access token then reduces the duration of potential vulnerability.

### Authentication and TOP projects

For the purposes of TOP projects going forward, stick to stateful authentication using sessions. None of this means stateless authentication or JWTs are inherently bad, only that for the purposes of projects in this curriculum, it's not really worth the additional complexity trying to implement a more secure stateless solution when you can use a stateful one instead. "Scaling" is only relevant in context, and curriculum projects or even many small personal projects are seldom going to get to the point where stateful solutions will be a genuine performance bottleneck that requires a stateless solution instead.

There are plenty of good and bad implementations of authentication out in the wild, both stateful and stateless, hence it's good to be aware of the concepts and mechanisms. You may end up working with things in the future where stateless authentication (whether with JWTs or other types of tokens) makes perfect sense. As far as TOP projects are concerned though, that isn't quite the case; simply put, our use case for authenticating requests from an SPA and separate server is one where stateful sessions are a very appropriate solution, more so than stateless JWTs.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Read ["Stop using JWT for sessions"](http://cryto.net/~joepie91/blog/2016/06/13/stop-using-jwt-for-sessions/) for a breakdown of why the proposed benefits of JWTs (for essentially the same thing as sessions) may not be worth the complexities and potential vulnerabilities.
1. Read another take on [avoiding JWTs to implement browser sessions](https://ianlondon.github.io/posts/dont-use-jwts-for-sessions/).

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [Why might a product want to use stateless authentication instead of stateful?](#stateful-vs-stateless)
- [What issues might one face with stale data in authentication tokens?](#authentication-and-authorization)
- [What issues might stateless authentication have regarding invalidation?](#invalidation)

### Additional resources

This section contains helpful links to related content. It isn't required, so consider it supplemental.

- It looks like this lesson doesn't have any additional resources yet. Help us expand this section by contributing to our curriculum.
