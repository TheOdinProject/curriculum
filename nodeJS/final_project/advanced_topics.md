### Introduction

As you work on more sophisticated web applications, there are some further concepts that might be good for you to be aware of, which we've left until now to avoid rabbit holes. In this lesson, we'll briefly talk about some of them along with possible ways to incorporate them into your Express applications.

### Lesson overview

This section contains a general overview of topics that you will learn in this lesson.

- Content Security Policy.
- Logging.
- Cross-Site Request Forgery.
- Internationalisation.
- Cross-Origin Resource Sharing.
- Rate limiting.

### Content Security Policy

Depending on the app you are building, chances are you might want to limit what kind of resources are allowed on it. [Content Security Policy (CSP)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/CSP) is a feature that allows you to restrict what resources are loaded on your pages. This is important because it can prevent a few common vulnerabilities:

- **Cross-site scripting (XSS)**: The most common reason why you would want to employ a CSP. By restricting how JavaScript could be loaded and/or injected into your app, you can protect your app and your clients.
- **Clickjacking**: Attackers could also embed certain HTML elements (such as an `<iframe>`), overlaying your UI and hiding what's really under it. A user clicks something, thinking it'll done one thing, but the real button underneath actually does something different instead, such as overlaying a fake "close" button over a "submit" button.

### Logging

Logging information in your app can help you identify what your app is doing at any given moment and display some errors internally that will be helpful for debugging and/or providing some useful data analytics, such your app's traffic distribution, how long do users tend to stay on certain endpoints, etc. The main point about leaving a series of ongoing record is that you could look back and see what went wrong or right, like leaving an entry in your diary!

Logging could be as simple as a few `console.log()`s in certain routes or you could introduce an entire library like [pino](https://github.com/pinojs/pino) or [winston](https://github.com/winstonjs/winston) into your workflow. These libraries are often optimized for performance and can give you back a lot of detail that'll prove useful.

### Cross-Site Request Forgery

Another very common exploit in the World Wide Web. Imagine you encountered a strange but very innocent looking website called `cutekittens.com`...until you inspect its HTML that looks like this.

```html
<form action="https://my-bank.example.org/transfer" method="POST">
  <input type="hidden" name="recipient" value="attacker" />
  <input type="hidden" name="amount" value="1000" />
</form>
```

Then, within that site, a small but very dangerous snippet of JavaScript is embedded and will be loaded if anyone clicked on it...

```javascript
const form = document.querySelector("form");
form.submit();
```

Assuming you are still logged in and your banking app's cookies still persist, disaster has already been struck! "Wait, I just want to see kittens! Why is my money gone?!" Yikes, you don't want that, right? [Cross-Site Request Forgery (CSRF) attacks](https://developer.mozilla.org/en-US/docs/Web/Security/Attacks/CSRF) are just that: tricking a user into performing a state-changing request to a certain target site from a malicious site. In this case, a form was automatically submit the moment you landed on `cutekittnes.com` and a banking transaction was silently performed.

So what could you do about it? One of the most common methods is to use a CSRF token. Every time you prompt your user to perform some state-changing request in your application, check for a hidden, unpredictable key (this could be embedded inside a `<form>` or an HTTP request header). Then, in your app, carry out the request if and only if the token is valid.

### Internationalization

Eventually, you might want to adapt your app to a wider range of audiences around the world. [Internationalization (I18n)](https://learn.microsoft.com/en-us/globalization/methodology/software-internationalization) is a process of adapting your applications to different populations/languages. This could involve taking a look at a client's [Accept-Language header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Accept-Language) and serve the content in the language that they want to see.

MDN documentations also accommodate a wide range of languages! For example, <https://developer.mozilla.org/fr/> will display all your pages in MDN in French! C'est pratique, non?

### Cross-Origin Resource Sharing

Previously on the blog API project, when we want to share data across two different origins, we'll have to configure reverse proxies on our platform that we host our SPA. Recall that reverse proxies allow requests from our front end app to travel to our back end as if both apps were on the same origin (or first-party). When there is no reverse proxy in-between, that is when we will have to be concerned about Cross-Origin Resource Sharing.

Cross-Origin Resource Sharing (CORS) is a mechanism that allows a server to grant access to its resources from different origins. Let's take the blog API project as an example. Suppose you have the following origins for both your front-end React app and your Express app:

- `https://www.my-blog-app.com`
- `https://www.my-blog-app-api.com`

Normally, browsers will restrict cross-origin HTTP requests due to security concerns, such as CSRF attacks, which we mentioned above. If we want to enable resource sharing across a different origin, we'll have to configure our API to accept `my-blog-app` as one of its allowed origins.

Depending on what kind of method you use in your request, a pre-flight request (a request to verify before our request) might be made to determine if such request could be safely made. This is done automatically by the browser via an `OPTIONS` request, using headers like `Access-Control-Request-Method` and `Origin` to ask the server what's allowed. Pre-flight requests are necessary for methods (such as `POST`) that could alter the state of our application. Non-destructive requests (like `GET`) do not trigger a pre-flight request. Nonetheless, the request's origin must still be validated by the `Access-Control-Allow-Origin` header.

### Rate limiting

Just like how your city has speed limit signs, [rate limiting](https://www.cloudflare.com/learning/bots/what-is-rate-limiting) is a technique that tracks a user's number of requests and puts a limit on how many times they can access a resource, such as how many requests they're allowed per day. This becomes especially important as your API grows, protecting you from [Denial of Service](https://www.cloudflare.com/learning/ddos/glossary/denial-of-service/) attacks.

This is commonly employed on sensitive endpoints, like ones involving authentication. You might've faced a similar problem where, after a number of unsuccessful attempts of logging into an application, it will temporarily lock you out and remind you to try again after half an hour or so. This is rate limiting coming into play because we want to protect users from brute-force login attacks. rate limiting can involve tracking both a user's IP address and their username and checking how many requests they have made before our application stops or slows them down before any more requests are made.

### Conclusion

That was quite a lot that we covered. Hopefully by being aware of these concepts, you are now able to imagine what goes on under the hood of the software you are using in your everyday life.

### Assignment

<div class="lesson-content__panel" markdown="1">

1. [ExpressJS' security best practices](https://expressjs.com/en/advanced/best-practice-security/) will help you well in securing your Express app. This guide also suggests a few libraries that could be helpful, should you want to tighten up your app's security without doing everything from scratch.

</div>
