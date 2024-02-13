### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Explain how token authentication differs from session based authentication.
- What are JSON Web Tokens? 
- What is an authorization header? How do we use it?
- Identify and explain the methods used to sign and verify tokens.
- Write custom middleware to verify tokens on a given route.
- Have familiarity with token expiration with JWT.
- Expand PassportJS implementations to use JSON Web Tokens.

### Overview
Securing your API is an important step. When we were using Express to serve view templates we used PassportJS along with a username and password to authenticate users, but that is not the only way to secure an Express app, and in the context of an API it often makes sense to use a different strategy.  The username and password session pattern that we learned previously will still work of course, though it is made a little more complicated by the fact that we've separated our front-end code from the back-end.

Another strategy is to generate and pass a secure **token** between our back-end and front-end code.  <span id='secure-token'>Doing so will make sure that our user's username and password are not compromised and will also give us the ability to expire our user's session for added security</span>. The basic idea is that when a user signs in to our app, a secure token is created, and then for all subsequent requests <span id='pass-token'>that token is passed in the header of our request object</span>. In the end, the process is straightforward since you should already be comfortable with using passport to authenticate users.

This strategy, while particularly useful with APIs can be used with a traditional view-template project as well. The main difference here is that instead of setting and checking a cookie we're passing a special token in the header of our request. In our previous Authentication Tutorial, the Passport middleware checked the cookie that was sent and then either authenticated or denied our user. In this case, we're going to do something very similar, but instead of using cookies, we're going to pass the token.


### Assignment

<div class="lesson-content__panel" markdown="1">

1. [This video](https://www.youtube.com/watch?v=7nafaH9SddU) is a great resource that explains everything you need to know about creating and verifying JSON Web Tokens.
2. [This video](https://www.youtube.com/watch?v=7Q17ubqLfaM) presents the different ways in which the JWT are quite useful.
</div>


### Additional resources
This section contains helpful links to other content. It isn't required, so consider it supplemental.

- [This article](https://web.archive.org/web/20230207144457/https://laptrinhx.com/a-practical-guide-for-jwt-authentication-using-node-js-and-express-917791379/) goes even further in depth than the one that we posted above. It provides a little greater understanding but is harder to follow.
- [This article](https://medium.com/@paul.allies/stateless-auth-with-express-passport-jwt-7a55ffae0a5c) covers the same thing as the above one, but is a little more concise.  Might be a good reference for when you're setting this up on your own later.
- Not everyone agrees that JWTs are the best way to store authentication data. [This video](https://www.youtube.com/watch?v=JdGOb7AxUo0) is one argument against using them, and some of the pitfalls that you may encounter with using them.


### Knowledge check
This section contains questions for you to check your understanding of this lesson. If you’re having trouble answering the questions below on your own, review the material above to find the answer.

- [What is a JSON web token?](https://dev.to/_arpy/learn-using-jwt-with-passport-authentication-22n8)
- [What are two things a secure token will do?](#secure-token)
- [Where in the code is a secure token passed?](#pass-token)
