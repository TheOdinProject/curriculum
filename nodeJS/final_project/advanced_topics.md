### Introduction

As you work on more sophisticated web applications, there are certain security guidelines to keep in mind as you go. In this lesson, we'll briefly talk about them and how you can incorporate that into your Express application.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Content Security Policy.
- Logging.
- Cross Site Request Forgery.
- Internationalisation.
- Cross-Origin Resource Sharing.
- Rate limiting.

### Content Security Policy

Depending on the app you are building, chances are you might want to limit what kind of resources are allowed on your it. Content Security Policy (CSP) is a feature that allows you to restrict what resources are loaded on your pages. This is important because it prevents a few common vulnerabilities:

- **Cross-site scripting (XSS)**: the most common reason why you would want to employ CSP. You do not want to allow attackers to freely inject JavaScripts into your app and target your clients.
- **Clickjacking**: attackers could also embed certain HTML elements (such as `<iframe>` to overlay your app UI elements and trick users to click on those element to perform something destructive.)

### Logging

Imagine a client is using your to-do application to manage their tasks. For some reasons, they keep facing a `500 Internal Server Error` response and complaint about it. You opened up your app's logs and...it's empty? Oh no, where in your app could that request be failing?!

Logging can help you with that: identifying what your app is doing at any given moment and displaying somer errors internally that will be helpful for debugging and/or providing some useful data analytics.

But you shouldn't log everything! Too much logging can really take a hit on your app's resources. You also do not want to expose your users' credentials in your logs! What if an attacker gain access to your machine?

Understand what needs to be logged. How you do tt could be as simple as a few `console.log()`s in certain routes or you could introduce an entire library like [pino](https://github.com/pinojs/pino) and let it do the heavy lifting for you.

### Cross Site Request Forgery

Another very common exploit in the World Wide Web. Imagine you encountered a strange but very innocent looking website called `cutekittens.com`...until you inspect its HTML that looks like this.

```html
<form action="https://my-bank.example.org/transfer" method="POST">
  <input type="hidden" name="recipient" value="attacker" />
  <input type="hidden" name="amount" value="1000" />
</form>
```

"Wait I just want to see kittens! Why is my money gone?!" Yikes, you don't want that, right? Cross Site Request Forgery (CSRF) attacks are just that: being tricked to perform a state-changing request to a certain target site from a mallicious site.

So what could you do about it? One of the most common method is to use CSRF token. Everytime you prompt your user to perform some state-changing request in your application, check for a hidden, unpredictable key (this could be embedded inside a `<form>` or a HTTP request header). Then, in your app, carry out the request if and only if the token is valid.

### Internationalisation

Eventually, you might want to adapt your app to a wider range of audiences around the world. [Internationalisation (I18n)](https://learn.microsoft.com/en-us/globalization/methodology/software-internationalization) is a process adapting your applications to different populations/languages.

One approach to do this is detecting taking a look at your user's [Accept Language header's](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Accept-Language) value. Then, from a markup file (like json or yaml), serve content that matches with what your client prefers. Sometimes you might have over a dozen of translated content to keep track of. In that case, something like [i18n-js](https://github.com/fnando/i18n-js) can help.

### Cross-Origin Resource Sharing

We touched upon this concept briefly in the blog API project, but let's do a more formal explanation. Cross-Origin Resource Sharing (CORS) is a mechanism that allows you to access resource from different origins. Let's take the blog API project as an example. Suppose you have the following origins for both your front-end React app and your Express app:

- `https://www.my-blog-app.com`
- `https://www.my-blog-app-api.com`

Normally, browsers will restrict cross-origin HTTP requests due to security concerns, like CSFR attacks, like we mentioned above. If we want to enable resource sharing across a different origin, we'll have to configure our API to accept `my-blog-app` as part of its accepted origin that it will deliver its responses to.

Depending on what kind of method you use in your request, A pre-flight request (a request to verify before our request) might be made to determine if such request could be safely made. This will often involve sending some kind of unique custom token to the server to verify. Pre-flight requests are necessary for methods (such as `POST`) that could alter the state of our application. Non-destructive requests (like `GET`) does not trigger a pre-flight request. Nonetheless, the request's origin must still be validate by the `Access-Control-Allow-Origin` header.

### Rate-limiting

Just like how your city has speed limit signs, [rate-limiting](https://www.cloudflare.com/learning/bots/what-is-rate-limiting/) is a technique that tracks users' number of requests and putting a limit on how many times they could access a resource and/or how many requests a user is limited to per day. This is especially helpful when your API is starting to grow and protecting yourself from [Denial of Service](https://www.cloudflare.com/learning/ddos/glossary/denial-of-service/) attacks.

This is commonly employed on sensitive end-points, like ones involving authentication. You might faced a similar problem where after a number of unsuccessful attempts of logging into an application, it will temporarily lock you out and remind you to try again for another half an hour so. This is rate-limiting coming into play because we want to protect users from brute-force log in attacks. Rate-limiting can involve tracking both a user's IP address and their username and checking how many requests has been made from them before our application stop or slow them down before any more requests are made.

### Conclusion

That was quite a lot that we covered. You don't have to apply all of these practices in your upcoming final project. That being said, hopefully by being aware of these concepts, you will be able to evaluate and design more reliable systems.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. [ExpressJS' security best practices](https://expressjs.com/en/advanced/best-practice-security/) will help you well in securing your Express app. This guide also suggests a few libraries that could be helpful, should you want to tighten up your app's security without doing everything from scratch.
1. MDN consists of many useful guides that will go more in depth with practical examples that you could learn from, so check those out as well.

    - [Content Security Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/CSP)
    - [Cross-Origin Resources Sharing](https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/CORS)
    - [Cross Site Request Forgery](https://developer.mozilla.org/en-US/docs/Web/Security/Attacks/CSRF)

</div>

### Knowledge check

The following questions are an opportunity to reflect on key topics in this lesson. If you can't answer a question, click on it to review the material, but keep in mind you are not expected to memorize or master this knowledge.

- [What does Content Security Policy protect your app from?](#content-security-policy)
- [When logging, what kind information should not appear?](#logging)
- [What is Cross Site Request Forgery?](#cross-site-request-forgery)
- [How does Cross-Origin Resources Sharing work?](#cross-origin-resource-sharing)
- [Why is rate-limiting needed on sensitive routes?](#rate-limiting)
